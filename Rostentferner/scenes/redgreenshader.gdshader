shader_type canvas_item;
render_mode blend_mix;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform bool activated = false;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	if (!activated) {
			COLOR=color;
		} else {
			
			// if the pixel has enough red
			if (color.r > 0.3f+(color.b+color.g)/2.0f && color.r > 0.4) {
				vec4 tempcol = vec4(color.b,color.r,color.g,color.a);
				COLOR = tempcol;
			} else COLOR=color;
		}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
