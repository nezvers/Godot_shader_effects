shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform vec2 size = vec2(64,64);// GLES2 need to provide texture size
uniform float float_speed = 1.0;
uniform float float_amount = 0.5;
uniform float rotation_speed = 2.0;
uniform float rotation_amount = 0.3;
uniform float rotation_direction = -1.0;
const float PI = 3.14159265359;

void vertex(){
	vec2 vertex;
    vertex = VERTEX - size*0.5; //GLES2 version
    //vertex = VERTEX - textureSize(TEXTURE, 0)*0.5; //GLES3 version
    vec2 diff = VERTEX - vertex;    
    
    float len = length(vertex);
	float angle = atan(vertex.y, vertex.x);
	
	float value;
	//value = PI*TIME*rotation_speed*rotation_direction;	//continuous version
	value = PI * sin(PI*0.5*TIME*rotation_speed*rotation_direction)*rotation_amount; // sine version
	
	float vertY = abs(vertex.y); // vertical distance before rotation
	VERTEX.x = cos(angle+ value) * len + diff.x;
	VERTEX.y = sin(angle+ value) * len + diff.y;
	
	
	float vertical;
	vertical = (sin(PI * 0.5 * TIME * float_speed)*0.5 + 0.5) * (vertY * 2.0 *float_amount); //sine version
	//vertical = abs(sin(PI * 0.5 * TIME * float_speed)) * float_amount; //abs version
	
	VERTEX.y -= vertical;
}