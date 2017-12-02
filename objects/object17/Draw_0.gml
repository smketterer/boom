/// @description Place the matrix in the MATRIX WORLD.
var matrix = matrix_build(x, y, z-(size*3/4), 90, 90, objPlayer.camera_direction, 3/4, 3/4, -3/4);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(sprite_index, image_index);
vertex_submit(vb_billboard, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());
