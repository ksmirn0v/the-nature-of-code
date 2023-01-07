Vehicle vehicle;
Path path;


void setup() {
  size(1240, 800);
  vehicle = new Vehicle(50, 3*height/4);
  path = new Path();
}


void draw() {
   background(255);
   vehicle.follow(path);
   vehicle.update();
   vehicle.display();
   path.display();
}
