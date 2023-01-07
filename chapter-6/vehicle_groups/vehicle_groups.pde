ArrayList<Vehicle> vehicles;


void setup() {
  size(1240, 800);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 100; i++) {
    vehicles.add(new Vehicle(random(width), random(height))); 
  }
}


void draw() {
   background(255);
   for (Vehicle vehicle: vehicles) {
     vehicle.applyBehaviors(vehicles, new PVector(mouseX, mouseY));
     vehicle.update();
     vehicle.display();
   }
}
