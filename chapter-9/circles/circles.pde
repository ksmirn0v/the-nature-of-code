void setup() {
  size(800, 600); 
}


void draw() {
  background(255);
  drawCircle(width/2, height/2, 200);
}


void drawCircle(float x, float y, float radius) {
  stroke(0);
  noFill();
  ellipse(x, y, radius, radius);
  if (radius > 2) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
  }
}
