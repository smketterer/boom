/// @description Initialize vars.

z = layer_get_depth(layer) + 32;
size = 32;
format = vertex_format();
buffer = vertex_buffer_wall();
texture_sprite = sprWall;

instance_create_layer(x,y,layer,objBlockHorizontal);
instance_create_layer(x,y,layer,objBlockVertical);
instance_create_layer(x,y+size*2,layer,objBlockHorizontal);
instance_create_layer(x+size*2,y,layer,objBlockVertical);

instance_destroy(self);