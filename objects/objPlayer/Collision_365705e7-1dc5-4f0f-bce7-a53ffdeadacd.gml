/// @description Insert description here

var other_depth = layer_get_depth(other.layer);

if z != other_depth {
  exit;
}

if not place_meeting(x+hspeed,y+vspeed,other) {
  layer = other.layer;
  instance_deactivate_layer(other.target_layer);
  console_log(other.target_layer + " deactivated");
}
