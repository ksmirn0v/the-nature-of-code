Vehicle vehicle;


void setup() {
  size(1240, 800);
  vehicle = new Vehicle(width/4, 3*height/4);
}


void draw() {
   background(255);
   PVector mousePosition = new PVector(mouseX, mouseY);
   vehicle.seek(mousePosition);
   vehicle.update();
   vehicle.display();
}
