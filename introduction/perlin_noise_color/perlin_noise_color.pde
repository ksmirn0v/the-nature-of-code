float xseed = 0.0;
float yseed = 0.0;


void setup() {
  size(640, 360);  
  loadPixels();
}

void draw() {
  float xoff = xseed;
  
  for (int x = 0; x < width; x++) {
    float yoff = yseed;
    for (int y = 0; y < height; y++) {
      float bright = map(noise(xoff, yoff), 0, 1, 0, 255);
      pixels[x + y * width] = color(bright);
      yoff += 0.05;
    }
    xoff += 0.05;
  }
  updatePixels();
  xseed += 0.05;
  yseed += 0.01;
}
