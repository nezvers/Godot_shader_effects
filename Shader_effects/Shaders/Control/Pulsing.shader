shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform vec2 size = vec2(64,64);// GLES2 need to provide texture size
uniform float speed = 1.0;
uniform float amount = 0.3;
const float PI = 3.14159265359;

void vertex(){
	vec2 vertex;
    vertex = VERTEX - size*0.5; //GLES2 version
    //vertex = VERTEX - textureSize(TEXTURE, 0)*0.5; //GLES3 version
	
    
    VERTEX += vertex * abs(sin(PI * 0.5 * TIME * speed)) * amount;
	//VERTEX += vertex * (sin(PI * 0.5 * TIME * speed)*0.5 + 0.5) * amount; //sine version
}