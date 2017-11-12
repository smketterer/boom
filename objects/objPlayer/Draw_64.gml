/// @description Draw application surface and shader.

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

draw_surface_stretched(application_surface,0,0,window_get_width(),window_get_height()); 

shader_reset();  //  Disable Shader.

// Misc. sizes:
// Viewport Width  = 960px
// Viewport Height = 540px
// Hud Height = 18px

var scale_adjustment = window_get_width() / view_get_wport(0);
var hud_scale = 18 * 4 * scale_adjustment;
var bob_vertical = round(sin(current_time/250) * abs((speed/max_speed) * 4)) * 8 * scale_adjustment;
var bob_horizontal = round(cos(current_time/500) * abs((speed/max_speed) * 4)) * 8 * scale_adjustment;
var gun_x = window_get_width()/2 + bob_horizontal + round(random_range(-shake,shake)) * 8 * scale_adjustment;
var gun_y = window_get_height() - hud_scale + bob_vertical + round(random_range(-shake,shake)) * 8 * scale_adjustment;

if weapon == "pistol" then draw_sprite_ext(sprPistol,image_index,gun_x,gun_y,8*scale_adjustment,8*scale_adjustment,0,c_white,1);
if weapon == "shotgun" then draw_sprite_ext(sprShotgun,image_index,gun_x,gun_y,8*scale_adjustment,8*scale_adjustment,0,c_white,1);
if weapon == "chaingun" then draw_sprite_ext(sprChaingun,image_index,gun_x,gun_y,8*scale_adjustment,8*scale_adjustment,0,c_white,1);
draw_sprite_ext(sprHud,0,window_get_width()/2,window_get_height(),4*scale_adjustment,4*scale_adjustment,0,c_white,1);