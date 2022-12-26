float angle = 0;
float angular_velocity = 0;
float angular_acceleration = 0.001;


void setup() {
  size(640, 360); 
}


void draw() {
  background(255);
  fill(175);
  rectMode(CENTER);
  translate(width/2,height/2);
  rotate(angle);
  line(-50, 0, 50, 0);
  ellipse(50, 0, 8, 8);
  ellipse(-50, 0, 8, 8);
  angular_velocity += angular_acceleration;
  angle += angular_velocity;
}
