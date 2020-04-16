shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform vec2 size = vec2(64,64);// GLES2 need to provide texture size
uniform float speed = 1.0;
uniform float amount = 0.3;
uniform float direction = -1.0;
const float PI = 3.14159265359;

void vertex(){
	vec2 vertex;
    vertex = VERTEX - size*0.5; //GLES2 version
    //vertex = VERTEX - textureSize(TEXTURE, 0)*0.5; //GLES3 version
    vec2 diff = VERTEX - vertex;
    
	float len = length(vertex);
	float angle = atan(vertex.y, vertex.x);
	
	float value;
	value = PI*TIME*speed*direction;	//continuous
	value = PI * sin(PI*0.5*TIME*speed*direction)*amount;
	
	VERTEX.x = cos(angle+ value) * len + diff.x;
	VERTEX.y = sin(angle+ value) * len + diff.y;
}