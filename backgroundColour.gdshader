shader_type canvas_item;

uniform vec4 colour : source_color = vec4(1.0, 1.0, 0.0, 1.0);
uniform float tint_factor : hint_range(0.0, 1.0) = 0.5;
uniform float fade : hint_range(0.0, 1.0) = 1.0;

void vertex() {
	vec4 main_texture = texture(TEXTURE, UV);
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
