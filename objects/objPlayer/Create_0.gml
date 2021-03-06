/// @description Initialize game variables.
z = -32;
camera_direction = 0;
shake = 0;
max_speed = 8;
friction = .45;
acceleration = 1.5;
room_speed = 40;

// Reset the cursor.
window_set_cursor(cr_none);

// Setup z writing.
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(40);

// Enable and set views to the perspective camera.
view_enabled = true;
view_set_visible(0, true);
camera = camera_create();
projection_matrix = matrix_build_projection_perspective_fov(50, view_get_wport(0)/view_get_hport(0), 1, 32000);
camera_set_proj_mat(camera, projection_matrix);
view_set_camera(0, camera);

// Camera script that controls positioning and mouselook.
camera_set_update_script(camera, camera_update);

// Setup some player options.
hp = 99;
armor = 99;
weapon = "pistol";
cooldown = 0;
shooting = false;
bullets = 360;
shells = 12;

face_image = 8;
emotion = "suspicious";
hud_on = true;
hud_offset = 0;
alarm[0] = 60;

// Setup some utility variables.
game_timer = 0;
no_clip = false;

// Create the console.
messages = ds_list_create();
messages_pop_at = ds_list_create();
