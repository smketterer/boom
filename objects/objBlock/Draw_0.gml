/// @description Insert description here
// You can write your code in this editor

var matrix = matrix_build(x, y+size, z-size, 90, 90, 0, 1, 1, -1);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(sprWall, 1);
vertex_submit(vb_wall_horizontal, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());



var matrix = matrix_build(x+(size*2), y+size, z-size, 90, 90, 0, 1, 1, -1);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(sprWall, 1);
vertex_submit(vb_wall_horizontal, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());



var matrix = matrix_build(x+size, y, z-size, 90, 0, 0, 1, 1, -1);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(sprWall, 1);
vertex_submit(vb_wall_horizontal, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());



var matrix = matrix_build(x+size, y+(size*2), z-size, 90, 0, 0, 1, 1, -1);

// The world matrix is what is used to transform drawing within "world" or "object" space.
matrix_set(matrix_world, matrix);

// Draw the buffer.
var texture = sprite_get_texture(sprWall, 1);
vertex_submit(vb_wall_horizontal, pr_trianglelist, texture);

// Resetting transforms can be done like this:
matrix_set(matrix_world, matrix_build_identity());