float xPos = 100;
float yPos = 100;
float xVel = 1;
float yVel = 3.3;

void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  background(255);
  
  xPos = xPos + xVel;
  yPos = yPos + yVel;
  
  if ((xPos > width) || (xPos < 0)) {
    xVel = -xVel;
  }
  
  if ((yPos > height) || (yPos < 0)) {
    yVel = -yVel;
  }
  
  stroke(0);
  fill(175);
  ellipse(xPos, yPos, 16, 16);
}
