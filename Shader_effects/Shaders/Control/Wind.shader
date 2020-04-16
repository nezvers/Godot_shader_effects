shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform vec2 size = vec2(64,64);// GLES2 need to provide texture size
uniform float wind_power = 0.3;
uniform float speed = 1.0;

void vertex(){
	vec2 vertex;
    vertex = VERTEX - size*0.5; //GLES2 version
    //vertex = VERTEX - textureSize(TEXTURE, 0)*0.5; //GLES3 version
    
	float height_weight = sign(vertex.y)*0.5 - 0.5;
	float sway_value = sin(TIME*speed) * wind_power * abs(vertex.x*2.0);
	VERTEX.x += height_weight * sway_value;
}