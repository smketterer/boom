/// @description Draw a few walls.

// Set the texture.
var texture_image = image_index;

// This is from the internet somewhere.


// North-facing
var matrix = matrix_build(x+size, y, z-size, 90, 0, 0, -1, 1, -1);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(texture_sprite, texture_image);
vertex_submit(vb_wall, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());



// South-facing
var matrix = matrix_build(x+size, y+(size/4), z-size, 90, 0, 0, 1, 1, -1);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(texture_sprite, texture_image);
vertex_submit(vb_wall, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());


// Floor.
var matrix = matrix_build(x+size, y+(size/8), z, 180, 0, 0, -1, 1/8, -1);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(texture_sprite, texture_image);
vertex_submit(vb_wall, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());
