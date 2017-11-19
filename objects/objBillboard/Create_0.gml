/// @description Initialize z, size, and vertex.

z = layer_get_depth(layer) + 32;
size = 16;
format = vertex_format();
buffer = vertex_buffer_billboard();