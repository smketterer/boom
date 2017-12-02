/// @description Just bounce against blocks for now.

if no_clip then exit;

var other_depth = layer_get_depth(other.layer);

if z != other_depth && abs(other_depth - round(z)) >= 64 {
  other.solid = false;
  exit;
}

other.solid = true;

switch other.object_index {
  case objBlockHorizontal:
    if other.y < y {
      motion_add(270, abs(vspeed));
      break;
    } else {
      motion_add(90, abs(vspeed));
      break;
    }
  case objBlockVertical:
    if other.x < x {
      motion_add(0, abs(hspeed));
      break;
    } else {
      motion_add(180, abs(hspeed));
      break;
    }
  case objBlockAngle1LeftUp:
    x = xprevious;
    y = yprevious;
    motion_add(135, speed/2);
    break;
  case objBlockAngle1RightDown:
    x = xprevious;
    y = yprevious;
    motion_add(315, speed/2);
    break;
  case objBlockAngle2LeftDown:
    x = xprevious;
    y = yprevious;
    motion_add(225, speed/2);
    break;
  case objBlockAngle2RightUp:
    x = xprevious;
    y = yprevious;
    motion_add(45, speed/2);
    break;
}
