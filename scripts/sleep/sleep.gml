/// @description Sleep the game for x milliseconds.
/// @arg sleep_duration

var t = current_time + argument0;
while (current_time < t) { /* idle loop */ }