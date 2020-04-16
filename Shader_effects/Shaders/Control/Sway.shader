shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform vec2 size = vec2(64,64);// GLES2 need to provide texture size
uniform float vertical_power = 0.3;
uniform float horizontal_power = 0.3;
uniform float speed = 1.0;

const float PI = 3.14159265359;

void vertex(){
	vec2 vertex;
    vertex = VERTEX - size*0.5; //GLES2 version
    //vertex = VERTEX - textureSize(TEXTURE, 0)*0.5; //GLES3 version
    
	float height_weight;
	//height_weight = sign(vertex.y)*0.5 - 0.5;// bottom fixed
	height_weight = sign(vertex.y)*0.5 + 0.5;// bottom fixed
	
	float mult = sin(PI * 0.5 * TIME * speed);
	
	float y_length = abs(vertex.y);
	VERTEX.y -= y_length * height_weight * vertical_power * abs(mult);
	
	float x_length = abs(vertex.x);
	VERTEX.x += x_length * height_weight * horizontal_power * mult * sign(vertex.x);
}