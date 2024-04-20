shader_type canvas_item;

uniform sampler2D noise;
uniform bool activated = false;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if (!activated) {
		COLOR=vec4(0.0f,0.0f,0.0f,0.0f);
	} else {
		vec4 tempc=vec4(texture(noise,UV).x,0,0,0.5);
		vec2 center = vec2(0.5,0.5);
		float dist = distance(UV,center);
		COLOR = pow(dist,1)*tempc;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
