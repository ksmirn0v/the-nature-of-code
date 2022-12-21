void setup() {
  size(640, 360);
}

void draw() {
  float num = randomGaussian();
  
  float std = 60;
  float mean = 320;
  
  float x = mean + num * std;
  
  noStroke();
  fill(0, 10);
  ellipse(x, 180, 16, 16);
}
