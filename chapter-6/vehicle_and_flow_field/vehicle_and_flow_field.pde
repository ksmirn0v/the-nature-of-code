Vehicle vehicle;
FlowField flowField;


void setup() {
  size(1240, 800);
  vehicle = new Vehicle(width/2, height/2);
  flowField = new FlowField();
}


void draw() {
   background(255);
   PVector mousePosition = new PVector(mouseX, mouseY);
   vehicle.follow(flowField);
   vehicle.update();
   vehicle.display();
}
