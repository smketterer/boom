/// @description Get rid of overlapping solids.

if z != z_to {
  z -= sign(z - z_to) * 8;
}