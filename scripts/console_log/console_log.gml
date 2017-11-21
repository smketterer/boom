// @arg string

var duration = 120;

ds_list_add(objPlayer.messages, "$ " + argument0);
ds_list_add(objPlayer.messages_pop_at, objPlayer.game_timer + duration);

if ds_list_size(objPlayer.messages_pop_at) > 1 {  
  var i;
  for (i=2; i<=ds_list_size(objPlayer.messages_pop_at); i++) {
    ds_list_replace(objPlayer.messages_pop_at, i-1, objPlayer.game_timer + (duration * i));
  }
}

audio_play_sound(sndRadio, 1, false);