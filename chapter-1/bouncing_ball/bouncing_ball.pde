PVector location;
PVector velocity;

void setup() {
  size(640, 360);
  background(255);
  location = new PVector(100, 100);
  velocity = new PVector(4.5, 1.5);
}

void draw() {
  background(255);
  
  location.add(velocity);
  
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = -velocity.x;
  }
  
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = -velocity.y;
  }
  
  stroke(0);
  fill(175);
  ellipse(location.x, location.y, 16, 16);
}
