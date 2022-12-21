class Walker {
  float x;
  float y;
  
  Walker() {
    this.x = width/2;
    this.y = height/2;
  }
  
  void display() {
    stroke(0);
    point(x,y);
  }
  
  void step() {
    float stepx = random(-1, 1);
    float stepy = random(-1, 1);
    this.x += stepx;
    this.y += stepy;
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
