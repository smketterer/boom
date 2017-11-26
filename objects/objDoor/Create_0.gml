/// @description Initialize vars.

/// z = 0;
z = layer_get_depth(layer) + 32;
z_initial = layer_get_depth(layer) + 32;
z_to = layer_get_depth(layer) + 32;
size = 32;
format = vertex_format();
buffer = vertex_buffer_wall();
texture_sprite = sprUNC;