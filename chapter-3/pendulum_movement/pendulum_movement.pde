Pendulum pendulum;


void setup() {
  size(640, 360);
  pendulum = new Pendulum(new PVector(width/2, 10), 125);
}

void draw() {
  background(255);
  pendulum.update();
  pendulum.display();
}
