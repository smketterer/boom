/// @description Insert description here

switch other.object_index {
  case objHealthPickup:
    hp += 25;
    console_log("Picked up a health pack.");
    break;
  case objBulletPickup:
    bullets += 30;
    break;
  case objShellPickup:
    shells += 6;
    break;
  case objArmorPickup:
    armor += 50;
    break;
}

audio_play_sound(sndItemPickup, 1, false);
instance_destroy(other);