/// @arg number
/// @arg x
/// @arg y
/// @arg scale

var string_number = string(argument0);

while string_length(string_number) < 3 {
  string_number = "0" + string_number;
}

for (i=0; i<string_length(string_number); i++) {
  var number_index = string_char_at(string_number, i + 1); 
  draw_sprite_ext(sprNumbers, int64(number_index), argument1+(11*i*argument3), argument2, argument3, argument3, 0, c_white, 1);
}
