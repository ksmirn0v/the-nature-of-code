void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);
  
  mouse.sub(center);
  
  float magnitude = mouse.mag();
  fill(0);
  rect(0, 0, magnitude, 10);
  
  translate(width/2, height/2);
  line(0, 0, mouse.x, mouse.y);
}
