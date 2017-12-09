/// @function raycast(x_from, y_from, z_from, direction, range, check_for)
/// @description Returns the first object that collides with a ray.
/// @arg0 x_from      x_from
/// @arg1 y_from      y_from
/// @arg2 z_from      z_from
/// @arg3 direction   direction
/// @arg4 range       range
/// @arg5 check for   object to check for

for (var i=0; i<argument4; i++) {
  var block_collision_object = collision_line(argument0, argument1, argument0+lengthdir_x(i, argument3), argument1+lengthdir_y(i, argument3), objBlock, true, true);
  if block_collision_object != noone and (block_collision_object.z == argument2 or abs(layer_get_depth(block_collision_object.layer) - round(z)) < 32) {
    return noone;
  }
  var collision_object = collision_line(argument0, argument1, argument0+lengthdir_x(i, argument3), argument1+lengthdir_y(i, argument3), argument5, true, true);
  if collision_object != noone and collision_object != self and collision_object.object_index != objBlock and (collision_object.z == argument2 or abs(layer_get_depth(collision_object.layer) - round(z)) < 32) {
    console_log(string(collision_object.object_index));
    return collision_object;
  } else {
    continue;
  }
}