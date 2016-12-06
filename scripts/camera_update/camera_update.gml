shake = objPlayer.shake;

x = objPlayer.x + random_range(-shake,shake);
y = objPlayer.y + random_range(-shake,shake);
z = objPlayer.z + random_range(-shake,shake);
direction = objPlayer.cameraDirection;

// Apply mouselook.
display_w=display_get_width();
display_h=display_get_height();
change_x=(display_mouse_get_x()-display_w/2)/9;
display_mouse_set(display_w/2,display_h/2);
objPlayer.cameraDirection -= change_x;

xx = lengthdir_x(1,direction);
yy = lengthdir_y(1,direction);
zz = z;

var matrix=matrix_build_lookat(x, y, z, x+xx, y+yy, z, 0, 0, 1);
camera_set_view_mat(view_camera[0], matrix);