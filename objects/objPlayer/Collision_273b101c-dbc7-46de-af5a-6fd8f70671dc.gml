/// @description Just bounce against blocks for now.

if no_clip then exit;

var other_depth = layer_get_depth(other.layer);

if z != other_depth && abs(other_depth - round(z)) >= 64 {
  other.solid = false;
  exit;
}

other.solid = true;
x = xprevious;
y = yprevious;

switch other.object_index {
  case objBlockHorizontal:
    if other.y < y {
      // Top facing.
      motion_add(270, abs(vspeed));
      break;
    } else {
      // Bottom facing.
      motion_add(90, abs(vspeed));
      break;
    }
  case objBlockVertical:
    if other.x < x {
      // Left facing.
      motion_add(0, abs(hspeed));
      break;
    } else {
      // Right facing.
      motion_add(180, abs(hspeed));
      break;
    }
  case objBlockAngle1LeftUp:
    motion_add(135, abs(speed/2));
    break;
  case objBlockAngle1RightDown:
    motion_add(315, abs(speed/2));
    break;
  case objBlockAngle2LeftDown:
    motion_add(225, abs(speed/2));
    break;
  case objBlockAngle2RightUp:
    motion_add(45, abs(speed/2));
    break;
}
