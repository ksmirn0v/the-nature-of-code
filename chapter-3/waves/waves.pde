float startAngle = 0;
float angle_velocity = 0.2;
float amplitude = 100;

void setup() {
  size(400, 200);
}

void draw() {
  background(255);
  
  stroke(0);
  strokeWeight(2);
  noFill();
  
  float angle = startAngle;
  
  beginShape();
  for (int x = 0; x <= width; x += 5) {
    float y = map(sin(angle), -1, 1, 0, height);
    vertex(x, y);
    angle += angle_velocity;
  }
  endShape();
  
  startAngle += angle_velocity;
}
