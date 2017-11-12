// @arg speed
// @arg direction

var movement_inputs = [];
movement_inputs[0] = ord("D");
movement_inputs[1] = ord("W");
movement_inputs[2] = ord("A");
movement_inputs[3] = ord("S");

var move_speed = 1;
var move_dir = objPlayer.camera_direction;
var move_xinput = 0;
var move_yinput = 0;

for (var i = 0; i < array_length_1d(movement_inputs); i++) {
  var this_key = movement_inputs[i];
  if keyboard_check(this_key) {
    var this_angle = i*90;
    move_xinput += lengthdir_x(1, this_angle);
    move_yinput += lengthdir_y(1, this_angle);
  }
}
 
var moving = (point_distance(0,0,move_xinput,move_yinput) > 0);
if moving  {
  move(move_speed, move_dir);
}