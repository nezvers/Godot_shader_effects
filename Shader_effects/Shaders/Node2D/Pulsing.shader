shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform float speed = 1.0;
uniform float amount = 0.3;
const float PI = 3.14159265359;

void vertex(){
	
	VERTEX += VERTEX * abs(sin(PI * 0.5 * TIME * speed)) * amount;
	//VERTEX += VERTEX * (sin(PI * 0.5 * TIME * speed)*0.5 + 0.5) * amount; //sine version
}
