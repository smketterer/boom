/// @description Raise door.
z_to = layer_get_depth(layer) + 32 - (size*2);
alarm[0] = 120;
audio_play_sound(sndDoorOpen, 1, false);