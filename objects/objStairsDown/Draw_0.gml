/// @description Draw a slope.

// Set the texture.
var texture_image = image_index;

var matrix = matrix_build(x+size, y+size, z-size, 135, 0, 0, -1, 1.41421356237, -1.41421356237);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(texture_sprite, texture_image);
vertex_submit(vb_wall, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());
