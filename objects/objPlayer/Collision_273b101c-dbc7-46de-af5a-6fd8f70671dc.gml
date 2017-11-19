/// @description Just bounce against blocks for now.

if noclip then exit;

var other_depth = layer_get_depth(other.layer);

if z != other_depth && abs(other_depth - round(z)) >= 64 {
  other.solid = false;
  exit;
}

other.solid = true;
move_bounce_solid(true);
speed /= 2;
