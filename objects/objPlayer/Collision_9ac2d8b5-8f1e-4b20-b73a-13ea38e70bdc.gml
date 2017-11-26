/// @description Just bounce against blocks for now.

if no_clip then exit;

var other_depth = other.z;

if z != other_depth && (round(z/64)*64 != round(other_depth/64)*64) {
  other.solid = false;
  exit;
}

other.solid = true;
move_bounce_solid(true);
speed /= 2;
