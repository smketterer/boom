var shake = objPlayer.shake;

var current_x = objPlayer.x + random_range(-shake,shake);
var current_y = objPlayer.y + random_range(-shake,shake);
var current_z = objPlayer.z + random_range(-shake,shake);
var current_direction = objPlayer.camera_direction;

// Apply mouselook.
var display_w=display_get_width();
var display_h=display_get_height();
var change_x=(display_mouse_get_x()-display_w/2)/9;
display_mouse_set(display_w/2,display_h/2);
objPlayer.camera_direction -= change_x;

var xx = lengthdir_x(1,current_direction);
var yy = lengthdir_y(1,current_direction);

var matrix=matrix_build_lookat(current_x, current_y, current_z, current_x+xx, current_y+yy, current_z, 0, 0, 1);
camera_set_view_mat(view_camera[0], matrix);

// var matrix=matrix_build_lookat(objPlayer.x, objPlayer.y, objPlayer.z, objPlayer.x+1, objPlayer.y, objPlayer.z, 0, 0, 1);
// camera_set_view_mat(view_camera[0], matrix);