void setup() {
  size(800, 600); 
}


void draw() {
  background(255);
  cantor(20, 20, width-40);
}


void cantor(float x, float y, float len) {
  if (len >= 1) {
    line(x, y, x + len, y);
    cantor(x, y + 20, len/3);
    cantor(x + 2*len/3, y + 20, len/3);
  }
}
