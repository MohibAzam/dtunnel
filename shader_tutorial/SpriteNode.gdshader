shader_type canvas_item; // First line of the shader

// NOTE: Godot's shader has a built-in TIME variable

// Adjusts the vertices of the image, mostly used for movement
void vertex() {
	VERTEX += vec2(cos(TIME)*100.0, sin(TIME)*100.0);
}

// A separate function, useful for minimizing repeat/hard code
vec4 red(){
	// Nested vector
    return vec4(vec3(1.0,0.0,0.0),1.0);
}

// Uniforms are values that constant within the shaedr and are passed to the shader
// by Godot. They're basically inputs to the shader! So they really only should be
// adjusted every frame (with each "process" step)00
uniform vec2 u_resolution; // Resolution of the canvas
uniform vec2 u_mouse; // Mouse position

// Runs on every pixel on the sprite (only the pixels in the sprites)
// and adjusts its colors
void fragment() {
	// COLOR = vec4(0.4, 0.6, 0.9, 1.0); // RGBA color
	// Called for every pixel the material is visible on.

	// Using UV...
	// COLOR = vec4(UV, 0.9, 1.0);

	// Read from the texture
	// COLOR = texture(TEXTURE, UV);
	// COLOR = red();

	// Adjust the blue value of the icon
	COLOR.b = 1.0;

	// Adjust the color continuously
	// COLOR = vec4(abs(sin(u_time)), 0.0, 0.0, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
