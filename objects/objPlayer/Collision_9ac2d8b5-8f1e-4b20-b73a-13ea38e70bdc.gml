/// @description Just bounce against blocks for now.

if no_clip then exit;

var other_depth = other.z;

if z != other_depth && (round(z/64)*64 != round(other_depth/64)*64) {
  other.solid = false;
  exit;
}

other.solid = true;
x = xprevious;
y = yprevious;

switch other.object_index {
  case objDoorUpDown:
    if other.y < y {
      // Top facing.
      motion_add(270, abs(vspeed));
      break;
    } else {
      // Bottom facing.
      motion_add(90, abs(vspeed));
      break;
    }
  case objDoorLeftRight:
    if other.x < x {
      // Left facing.
      motion_add(0, abs(hspeed));
      break;
    } else {
      // Right facing.
      motion_add(180, abs(hspeed));
      break;
    }
}