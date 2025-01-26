shader_type canvas_item;

void vertex() {

    float speed_modulation = sin(TIME * 0.5);
    float speed = 0.005 * (1.0 + speed_modulation);


    UV.x += TIME * speed;
    UV.y += TIME * speed;
}
