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
}

//move_outside_solid(direction, max_speed);
//move_bounce_solid(true);
//speed /= 2;
