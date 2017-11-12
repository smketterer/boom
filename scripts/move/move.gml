/// @arg speed
/// @arg direction

var spd = argument0;
var dir = argument1;

var xtarg = x+lengthdir_x(spd,dir);
var ytarg = y+lengthdir_y(spd,dir);

if place_free(xtarg,ytarg) {
    x = xtarg;
    y = ytarg;
}