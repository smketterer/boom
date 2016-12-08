/// @description Initialize camera and view.
z = -32;
cameraDirection = 0;
shake = 0;
max_speed = 8;
friction = .35;
acceleration = .75;

window_set_cursor(cr_none);

// Setup z writing.
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_fog(true, c_black, 100, 300);

// Enable and set views to the perspective camera.
view_enabled = true;
view_set_visible(0, true);
camera = camera_create();
projection_matrix = matrix_build_projection_perspective_fov(45, view_get_wport(0)/view_get_hport(0), 1, 32000);
camera_set_proj_mat(camera, projection_matrix);
view_set_camera(0, camera);

// Camera script that controls positioning and mouselook.
camera_set_update_script(camera, camera_update);

// Setup some player options.
weapon = "pistol";

// This will work better 
// draw_set_lighting(true);
// draw_light_define_point(1,x,y,z,200,c_white);
// draw_light_enable(1,true);