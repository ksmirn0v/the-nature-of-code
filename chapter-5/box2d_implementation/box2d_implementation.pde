import shiffman.box2d.*;


ArrayList<Box> boxes;
Box2DProcessing box2d;


void setup() {
  size(400,300);
  
  boxes = new ArrayList<Box>();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0.0, -10.0);
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
}
