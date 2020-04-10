shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform float speed = 1.0;
uniform float amount = 0.5;
const float PI = 3.14159265359;

void vertex(){
	float vertical;
	vertical = (sin(PI * 0.5 * TIME * speed)*0.5 + 0.5) * (abs(VERTEX.y) * 2.0 *amount); //sine version
	//vertical = abs(sin(PI * 0.5 * TIME * speed)) * amount; //abs version
	
	VERTEX.y -= vertical;
}
