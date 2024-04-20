shader_type canvas_item;

uniform sampler2D noise_texture : repeat_enable;
uniform float distortion_strengh: hint_range(0, 0.1) = 1.0;
uniform float speed: hint_range(0.1, 10) = 1.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 noise_pixel = texture(noise_texture, UV + floor(TIME*speed)/3.0);
	vec2 uv_offset = (noise_pixel.rg * 2.0 - 1.0) * distortion_strengh;
	COLOR = texture(TEXTURE, UV + uv_offset);
    //COLOR = noise_pixel;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
