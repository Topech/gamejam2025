shader_type canvas_item;

void sineWave() {

}

void vertex() {
	UV.x += TIME * sin(0.1 * 2.0);
	UV.y += TIME * 0.1;
}