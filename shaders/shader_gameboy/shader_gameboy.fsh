//####################
// Gameboy Shader V1.0
//####################

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//  These Uniform values are our color palette.  //
uniform vec3 u_color1;      //Darkest.
uniform vec3 u_color2;      //--------
uniform vec3 u_color3;      //--------
uniform vec3 u_color4;      //Lightest.

void main()     //  Where the magic happens
{
  //  Normalising the colours.  //
  vec3 col1 = u_color1/255.0; 
  vec3 col2 = u_color2/255.0;
  vec3 col3 = u_color3/255.0;
  vec3 col4 = u_color4/255.0;
    
  //  Storing color. //
  vec4 tempCol = texture2D( gm_BaseTexture, v_vTexcoord ); 
    
  //  Grabbing color intensity. - Uncomment/Comment each method to enable/disable. //
  // float colIntensity = max(tempCol.r,max(tempCol.g,tempCol.b));     //Intensity Method 1 - HSV Value.
  float colIntensity = (tempCol.r+tempCol.g+tempCol.b)/3.0;       //Intensity Method 2 - Average.
    
  //  Assigning Colors.  //
  float val=1.0;                                     //Color 1 is the default, and will remain so if no value is found.
  val = max(val,(float(colIntensity>0.165)*2.0));    //Comparisons (>, >=, <, <=, ==) are boolean, which we convert to float point simply by putting 'float' before our comparison, meaning if it's larger than 0.165 we'll get 1.0, and if it's less we get 0.0.
  val = max(val,(float(colIntensity>0.495)*3.0));    //0.495 is used on this line because it's exactly between 0.33 (Color 2) and 0.66 (Color 3). Being larger means we set our color to Color 3. This is done by simply multiplying the outcome of the comparison by the number we're assigning.
  val = max(val,(float(colIntensity>0.685)*4.0));    //Using 'max' means that if we already have a value it won't clear the color we've already set when the comparisons are false.
    
  //Changing 0.165, 0.495, and 0.825, change the thresholds at which the colours change.
    
  //  Since we have no if statements we have to set our colors using max and comparisons again.  //
  vec3 finalCol = vec3(0.0,0.0,0.0);
  finalCol = max(finalCol,    vec3(   col1.r*float(val==1.0),    col1.g*float(val==1.0),     col1.b*float(val==1.0)   ));
  finalCol = max(finalCol,    vec3(   col2.r*float(val==2.0),    col2.g*float(val==2.0),     col2.b*float(val==2.0)   ));
  finalCol = max(finalCol,    vec3(   col3.r*float(val==3.0),    col3.g*float(val==3.0),     col3.b*float(val==3.0)   ));
  finalCol = max(finalCol,    vec3(   col4.r*float(val==4.0),    col4.g*float(val==4.0),     col4.b*float(val==4.0)   ));
    
  //  Setting our output color.  //
  gl_FragColor = vec4(finalCol,1.0);
}
