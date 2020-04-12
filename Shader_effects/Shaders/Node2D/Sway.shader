shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform float vertical_power = 0.3;
uniform float horizontal_power = 0.3;
uniform float speed = 1.0;

const float PI = 3.14159265359;

void vertex(){
	float height_weight;
	//height_weight = sign(VERTEX.y)*0.5 - 0.5;// bottom fixed
	height_weight = sign(VERTEX.y)*0.5 + 0.5;// bottom fixed
	
	float mult = sin(PI * 0.5 * TIME * speed);
	
	float y_length = abs(VERTEX.y);
	VERTEX.y -= y_length * height_weight * vertical_power * abs(mult);
	
	float x_length = abs(VERTEX.x);
	VERTEX.x += x_length * height_weight * horizontal_power * mult * sign(VERTEX.x);
}