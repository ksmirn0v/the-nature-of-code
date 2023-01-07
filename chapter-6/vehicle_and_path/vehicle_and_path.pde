Vehicle vehicle;
Path path;


void setup() {
  size(1240, 800);
  vehicle = new Vehicle(50, 3*height/4);
  path = new Path();
  path.addPoint(0, height/2);
  path.addPoint(width/4, 3*height/4);
  path.addPoint(width/2, height/4);
  path.addPoint(3*width/4, height/2);
  path.addPoint(width, 3*height/5);
}


void draw() {
   background(255);
   vehicle.follow(path);
   vehicle.update();
   vehicle.display();
   path.display();
}
