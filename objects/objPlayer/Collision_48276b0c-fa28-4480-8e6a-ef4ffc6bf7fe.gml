/// @description Go up stairs.

switch other.object_index {
  case objStairsDown:
    if (round(z) != round(other.y - y)) {
      z = -32 + round(other.y - y);
    }
    break;
}