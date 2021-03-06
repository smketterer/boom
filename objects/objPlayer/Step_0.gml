/// @description Handle keys, move and shoot.

if keyboard_check(ord("W")) then motion_add(camera_direction,acceleration);
if keyboard_check(ord("A")) then motion_add(camera_direction+90,acceleration);
if keyboard_check(ord("S")) then motion_add(camera_direction,-acceleration);
if keyboard_check(ord("D")) then motion_add(camera_direction+90,-acceleration);

if keyboard_check(ord("R")) then game_restart();
if keyboard_check(vk_escape) then game_end();

if keyboard_check(ord("1")) then weapon = "fists";
if keyboard_check(ord("2")) then weapon = "pistol";
if keyboard_check(ord("3")) then weapon = "shotgun";
if keyboard_check(ord("4")) then weapon = "chaingun";

var is_fog = gpu_get_fog();

shooting = false;

if mouse_check_button(mb_left) && cooldown <= 0 {
  if weapon = "fists" {
    image_index = 1;
  }
  if weapon = "pistol" && bullets > 0 { 
    image_index = 1; // Play animation here instead.
    shake = 2;
    cooldown = 20;
    bullets -= 1;
    damage = 10;
    range = 64*10;
    var enemy = raycast(x, y, z, camera_direction, range, objEnemy);
    if enemy != noone {
      enemy.hp -= damage;
    }
    audio_play_sound(sndPistol, 1, false);
    if is_fog[0] then gpu_set_fog(true, fog_color, 100, 480);
  }
  if weapon = "shotgun" && shells > 0 { 
    image_index = 1; // Play animation here instead.
    shake = 10;
    cooldown = 30;
    shells -= 1;
    damage = 100;
    range = 64*4;
    var enemy = raycast(x, y, z, camera_direction, range, objEnemy);
    if enemy != noone {
      enemy.hp -= damage;
    }
    audio_play_sound(sndShotgun, 1, false);
    if is_fog[0] then gpu_set_fog(true, fog_color, 100, 480);
  }
  if weapon = "chaingun" && bullets > 0 {
    image_index = 1; // Play animation here instead.
    shake = 2;
    cooldown = 3;
    shooting = true;
    bullets -= 1;
    damage = 10;
    range = 64*10;
    var enemy = raycast(x, y, z, camera_direction, range, objEnemy);
    if enemy != noone {
      enemy.hp -= damage;
    }
    audio_play_sound(sndPistol, 1, false);
    if is_fog[0] then gpu_set_fog(true, fog_color, 100, 480);
  }
}
else {
  image_index = 0;
  if is_fog[0] then gpu_set_fog(true, fog_color, 100, 320);
}

// Open doors.
if mouse_check_button_pressed(mb_right) {
  range = 64;
  var door = raycast(x, y, z, camera_direction, range, objDoor);
  if door != noone {
    with (door) {
      alarm[1] = 1;
    }
  }
}

shake *= 0.5;
if cooldown > 0 {
  cooldown -= 1;
}

if speed > max_speed
{
speed = max_speed;
}

z = round(z / 32) * 32; // Reset the z for when you're off stairs...
z_real = -16;
z_to = -16;
z_speed = 1;

if z_to < z_real {
  z -= z_speed;
}

// Console functions.
game_timer += 1;
if game_timer == messages_pop_at[| 0] {
  ds_list_delete(messages, 0);
  ds_list_delete(messages_pop_at, 0);
}

// HUD face animations.
switch (emotion) {
  case "suspicious":
    if hp > 50 {
      face_image = 0;
    } else if hp > 25 {
      face_image = 4;
    } else if hp > 0 {
      face_image = 7;
    }
    if game_timer % 180 == 0 {
      if hp > 50 {
        if face_image == 1 {
          face_image = 0;
          exit;
        } else {
          face_image = 1;
        }
      } else if hp > 25 {
        if face_image == 5 {
          face_image = 4;
          exit;
        } else {
          face_image = 5;
        }
      }
    }
    break;
  case "angry":
    face_image = 2;
    break;
  case "happy":
    face_image = 3;
    break;
  default:
    emotion = "suspicious";
    face_image = 0;
    break;
}

// Toggle the HUD.
if keyboard_check_pressed(vk_tab) {
  hud_on = !hud_on;
}