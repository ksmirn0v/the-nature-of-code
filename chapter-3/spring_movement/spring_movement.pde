Mover mover;
Spring spring;


void setup() {
  size(640, 360);
  mover = new Mover(width/2, 10.0, 1.0);
  spring = new Spring(width/2, 10.0, 30.0);
}

void draw() {
  background(255);
  mover.applyForce(compute_gravity_force(mover));
  spring.connect(mover);
  spring.display();
  mover.startMovement();
}
