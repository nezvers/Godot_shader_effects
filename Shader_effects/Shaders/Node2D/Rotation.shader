shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform float speed = 1.0;
uniform float amount = 0.3;
uniform float direction = -1.0;
const float PI = 3.14159265359;

void vertex(){
	float len = length(VERTEX);
	float angle = atan(VERTEX.y, VERTEX.x);
	
	float value;
	value = PI*TIME*speed*direction;	//continuous
	value = PI * sin(PI*0.5*TIME*speed*direction)*amount;
	
	VERTEX.x = cos(angle+ value) * len;
	VERTEX.y = sin(angle+ value) * len;
}
