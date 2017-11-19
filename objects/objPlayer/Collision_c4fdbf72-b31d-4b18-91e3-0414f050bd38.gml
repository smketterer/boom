/// @description Insert description here

var other_depth = layer_get_depth(other.layer);

// 1: -32, 2: -96
if abs(z - other_depth) > 64  {
  exit;
}

switch other.object_index {
  case objStairsDown:
    if z != (other.y - y) + layer_get_depth(other.layer) {
      z = (other.y - y) + layer_get_depth(other.layer); 
    }
    break;
  case objStairsUp:
    if z != (y - other.y) + layer_get_depth(other.layer) {
      z = (y - other.y) + layer_get_depth(other.layer); 
    }
    break;
}

if not place_meeting(x+hspeed,y+vspeed,other) {
  z = round(z / other.size) * other.size;
  with (objBlock) {
    var block_depth = layer_get_depth(layer);
    if block_depth != objPlayer.z then solid = false;
  }
}