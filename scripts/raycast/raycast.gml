/// @function raycast(x_from, y_from, direction, range, check_for)
/// @description Returns the first object that collides with a ray.
/// @arg x_from      x_from
/// @arg y_from      y_from
/// @arg direction   direction
/// @arg range       range
/// @arg check for   object to check for

for (var i=0; i<argument3; i++) {
  var block_collision_object = collision_line(argument0, argument1, argument0+lengthdir_x(i, argument2), argument1+lengthdir_y(i, argument2), objBlock, true, true);
  if block_collision_object != noone {
    return noone;
  }
  var collision_object = collision_line(argument0, argument1, argument0+lengthdir_x(i, argument2), argument1+lengthdir_y(i, argument2), argument4, true, true);
  if collision_object != noone and collision_object != self and collision_object.object_index != objBlock {
    return collision_object;
  } else {
    continue;
  }
}