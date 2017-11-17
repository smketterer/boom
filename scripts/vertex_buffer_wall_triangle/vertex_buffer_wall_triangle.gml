//Create the vertex buffer. Another function, vetex_create_buffer_ext can be used to create the buffer with its size predefined and fixed. 
//With the standard vertex_create_buffer, the buffer will just grow automatically as needed.
vb_wall = vertex_create_buffer();

//Begin building the buffer using the format defined previously
vertex_begin(vb_wall, format);

//Add the six vertices needed to draw a simple square plane. 
//The normals are all pointing to (0,0,-1) (upward, in our case)

//The first triangle
vertex_position_3d(vb_wall, -size, -size, 0);
vertex_normal(vb_wall, 0, 0, 1);
vertex_color(vb_wall, c_white, 1);
vertex_texcoord(vb_wall, 0, 0);

vertex_position_3d(vb_wall, size, -size, 0);
vertex_normal(vb_wall, 0, 0, 1);
vertex_color(vb_wall, c_white, 1);
vertex_texcoord(vb_wall, 1, 0);

vertex_position_3d(vb_wall, -size, size, 0);
vertex_normal(vb_wall, 0, 0, 1);
vertex_color(vb_wall, c_white, 1);
vertex_texcoord(vb_wall, 0, 1);

//The second triangle. The winding order has been maintained so drawing is consistent if culling is enabled.
vertex_position_3d(vb_wall, -size, size, 0);
vertex_normal(vb_wall, 0, 0, 1);
vertex_color(vb_wall, c_white, 1);
vertex_texcoord(vb_wall, 0, 1);

vertex_position_3d(vb_wall, size, -size, 0);
vertex_normal(vb_wall, 0, 0, 1);
vertex_color(vb_wall, c_white, 1);
vertex_texcoord(vb_wall, 1, 0);

vertex_position_3d(vb_wall, size, size, 0);
vertex_normal(vb_wall, 0, 0, 1);
vertex_color(vb_wall, c_white, 1);
vertex_texcoord(vb_wall, 1, 1);

//Finish building the buffer.
vertex_end(vb_wall);