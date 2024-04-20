shader_type canvas_item;
render_mode blend_mix;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	// if the pixel has enough red
	vec4 tempcol = vec4(color.b,color.r,color.g,color.a);
	COLOR = tempcol;
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
