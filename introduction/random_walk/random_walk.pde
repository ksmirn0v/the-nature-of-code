class Walker {
  float x;
  float y;
  float tx;
  float ty;
  
  Walker() {
    this.tx = 0;
    this.ty = 10000;
    this.x = width/2;
    this.y = height/2;
  }
  
  void display() {
    stroke(0);
    point(this.x, this.y);
  }
  
  void step() {
    this.x = map(noise(tx), 0, 1, 0, width);
    this.y = map(noise(ty), 0, 1, 0, height);
    this.tx += 0.01;
    this.ty += 0.01;
  }
}


Walker walker;

void setup() {
  size(640, 360);
  walker = new Walker();
  background(255);
}

void draw() {
  walker.step();
  walker.display();
}
