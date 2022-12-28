import shiffman.box2d.*;


ArrayList<Box> boxes;
ArrayList<Boundary> boundaries;
Box2DProcessing box2d;


void setup() {
  size(400,300);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0.0, -10.0);
  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(width/4, height-4, width/2-50, 10));
  boundaries.add(new Boundary(3*width/4, height-50, width/2-50, 10));
}

void draw() {
  background(255);
  
  box2d.step();
  
  if (mousePressed) {
    Box box = new Box(mouseX, mouseY);
    boxes.add(box);
  }
  
  for (Box box: boxes) {
    box.display(); 
  }
  
  for (Boundary boundary: boundaries) {
    boundary.display(); 
  }
}
