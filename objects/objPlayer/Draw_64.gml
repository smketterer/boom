/// @description Draw application surface and shader.

draw_set_font(font_small);   // Add the UI font.
shader_set(shader_gameboy);  // Activate Shader.
var palette = 1;

//  Apply Palette Parameters.  //
if (palette==1)                  // Palette 1 - Original. //
{
    shader_set_uniform_f(shader_get_uniform(shader_gameboy,"u_color1"), 28, 28, 28);      //  Setting color 1
    shader_set_uniform_f(shader_get_uniform(shader_gameboy,"u_color2"), 77, 81, 60);      //  Setting color 2
    shader_set_uniform_f(shader_get_uniform(shader_gameboy,"u_color3"), 138, 150, 109);   //  Setting color 3
    shader_set_uniform_f(shader_get_uniform(shader_gameboy,"u_color4"), 199, 207, 162);   //  Setting color 4
}

draw_surface_stretched(application_surface,0,0,window_get_width(),window_get_height()); // Draw game surface.
shader_reset(); // Disable Shader.

// Initialize sizes for HUD elements. Here are a few:
// Viewport Width  = 960px
// Viewport Height = 540px
// Hud Height = 18px

gpu_set_fog(false, c_black, 100, 300);

var scale_adjustment = window_get_width() / view_get_wport(0);
var hud_scale = 18 * 4 * scale_adjustment;
var bob_vertical = round(sin(current_time/250) * abs((speed/max_speed) * 4)) * 8 * scale_adjustment;
var bob_horizontal = round(cos(current_time/500) * abs((speed/max_speed) * 4)) * 8 * scale_adjustment;
var gun_x = window_get_width()/2 + bob_horizontal + round(random_range(-shake,shake)) * 8 * scale_adjustment;
var gun_y = window_get_height()+(round(hud_offset/8 - (hud_offset / 2)/8)*8)- 4 - hud_scale + bob_vertical + round(random_range(-shake,shake)) * 8 * scale_adjustment;

// Draw the weapons.
if weapon == "fists" {
  draw_sprite_ext(sprFists,image_index,gun_x,gun_y,8*scale_adjustment,8*scale_adjustment,0,c_white,1);
}
if weapon == "pistol" {
  draw_sprite_ext(sprPistol,image_index,gun_x,gun_y,8*scale_adjustment,8*scale_adjustment,0,c_white,1);
}
if weapon == "shotgun" {
  draw_sprite_ext(sprShotgun,image_index,gun_x,gun_y,8*scale_adjustment,8*scale_adjustment,0,c_white,1);
}
if weapon == "chaingun" {
  if shooting == true then draw_sprite_ext(sprMuzzleFlash,round(random(1)),gun_x+(round(random(2) - 3)*8*scale_adjustment),gun_y-(15*8*scale_adjustment)+(round(random(2) - 1)*8*scale_adjustment),8*scale_adjustment,8*scale_adjustment,0,c_white,1);
  if shooting == true then draw_sprite_ext(sprMuzzleFlash,round(random(1)),gun_x+(round(random(2) + 1)*8*scale_adjustment),gun_y-(15*8*scale_adjustment)+(round(random(2) - 1)*8*scale_adjustment),8*scale_adjustment,8*scale_adjustment,0,c_white,1);
  if shooting == true then draw_sprite_ext(sprMuzzleFlash,round(random(1)),gun_x+(round(random(2) - 1)*8*scale_adjustment),gun_y-(17*8*scale_adjustment)+(round(random(2) - 1)*8*scale_adjustment),8*scale_adjustment,8*scale_adjustment,0,c_white,1);
  draw_sprite_ext(sprChaingun,image_index,gun_x,gun_y,8*scale_adjustment,8*scale_adjustment,0,c_white,1);
}

// Toggle the HUD.
if !hud_on and hud_offset != 24*4*scale_adjustment {
  hud_offset += 16*scale_adjustment;
  if hud_offset > 24*4*scale_adjustment {
    hud_offset = 24*4*scale_adjustment;
  }
}
if hud_on and hud_offset != 0 {
  hud_offset -= 16*scale_adjustment;
  if hud_offset < 0 {
    hud_offset = 0;
  }
}
// Draw the bottom HUD.
draw_sprite_ext(sprHud,0,window_get_width()/2,window_get_height()+hud_offset,4*scale_adjustment,4*scale_adjustment,0,c_white,1);
// Draw face sprites.
draw_sprite_ext(sprFaces,face_image,window_get_width()/2,window_get_height()+hud_offset,4*scale_adjustment,4*scale_adjustment,0,c_white,1);
// Draw the text in the HUD.
draw_set_color(make_color_rgb(199, 207, 162));

var vertical_offset = 4 * 20 * scale_adjustment;
var ammo_offset = 111;
var health_offset = 60;
var armor_offset = 28;

// Draw the ammo.
draw_set_halign(fa_right);
switch weapon {
  case "pistol":
    draw_bitmap_numbers(bullets, (-ammo_offset*4*scale_adjustment)+window_get_width()/2, window_get_height()+hud_offset-vertical_offset, 4*scale_adjustment);
    break;
  case "chaingun":
    draw_bitmap_numbers(bullets, (-ammo_offset*4*scale_adjustment)+window_get_width()/2, window_get_height()+hud_offset-vertical_offset, 4*scale_adjustment);
    break;
  case "shotgun":
    draw_bitmap_numbers(shells, (-ammo_offset*4*scale_adjustment)+window_get_width()/2, window_get_height()+hud_offset-vertical_offset, 4*scale_adjustment);
    break;
}

// Draw health and armour.
draw_bitmap_numbers(hp, (-health_offset*4*scale_adjustment)+window_get_width()/2, window_get_height()+hud_offset-vertical_offset, 4*scale_adjustment);
draw_bitmap_numbers(armor, (armor_offset*4*scale_adjustment)+window_get_width()/2, window_get_height()+hud_offset-vertical_offset, 4*scale_adjustment);

// Draw console.
for (i=0; i<ds_list_size(messages); i++) {
  draw_set_halign(fa_left);
  draw_set_color(make_color_rgb(77, 81, 60));
  draw_text_transformed(8,8+4*scale_adjustment + (i*(8)*4*scale_adjustment), messages[| i], 4*scale_adjustment, 4*scale_adjustment, 0);
  draw_text_transformed(8+4*scale_adjustment,8+4*scale_adjustment + (i*(8)*4*scale_adjustment), messages[| i], 4*scale_adjustment, 4*scale_adjustment, 0);
  draw_set_color(make_color_rgb(199, 207, 162));
  draw_text_transformed(8,8 + (i*8*4*scale_adjustment), messages[| i], 4*scale_adjustment, 4*scale_adjustment, 0);
}
draw_set_color(c_white);