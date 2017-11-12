/// @description Move and shoot.

if keyboard_check(ord("1")) then weapon = "pistol";
if keyboard_check(ord("2")) then weapon = "shotgun";
if keyboard_check(ord("3")) then weapon = "chaingun";
if keyboard_check(ord("W")) then motion_add(camera_direction,acceleration);
if keyboard_check(ord("A")) then motion_add(camera_direction+90,acceleration);
if keyboard_check(ord("S")) then motion_add(camera_direction,-acceleration);
if keyboard_check(ord("D")) then motion_add(camera_direction+90,-acceleration);

var is_fog = gpu_get_fog();

if mouse_check_button(mb_left) {
  image_index = 1;
  if weapon = "pistol" then shake = 2;
  if weapon = "shotgun" then shake = 10;
  if weapon = "chaingun" then shake = 2;
  if is_fog[0] then gpu_set_fog(true, c_black, 100, 400);
}
else {
  image_index = 0;
  if is_fog[0] then gpu_set_fog(true, c_black, 100, 300);
}

shake *= 0.5;

if speed > max_speed
{
speed = max_speed;
}

z_real = -16;
z_to = -16 + (-32*keyboard_check(vk_pageup)) + (32*keyboard_check(vk_pagedown));
z_speed = 1;

if z_to < z_real {
  z -= z_speed;
}