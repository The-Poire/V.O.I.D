uniform float time;


vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
      vec4 pixel = Texel(texture, texture_coords);//This is the current pixel color
      return pixel * (color * ((sin(time)+1)/2));
    }