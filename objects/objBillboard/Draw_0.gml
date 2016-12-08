/// @description Insert description here
// You can write your code in this editor

var matrix = matrix_build(x, y, z-size, 90, 90, objPlayer.cameraDirection, 1, 1, -1);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(sprite_1, image_index);
vertex_submit(vb_billboard, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());
