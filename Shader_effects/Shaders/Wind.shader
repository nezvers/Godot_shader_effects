shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform float wind_power = 0.3;
uniform float speed = 1.0;

void vertex(){
	float height_weight = sign(VERTEX.y)*0.5 - 0.5;
	float sway_value = sin(TIME*speed) * wind_power * abs(VERTEX.x*2.0);
	VERTEX.x += height_weight * sway_value;
}