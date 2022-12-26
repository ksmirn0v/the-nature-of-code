class Mover {
  
  PVector location;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  float angle = 0;
  float angle_velocity = 0;
  float angle_acceleration = 0;
  
  float mass;
  
  Mover(float xPos, float yPos, float mass) {
    this.location = new PVector(xPos, yPos);
    this.mass = mass;
  }
  
  void applyForce(PVector force) {
    this.acceleration.add(PVector.div(force, this.mass));
  }
  
  void update() {
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    
    this.angle_acceleration = this.acceleration.x / 10.0;
    this.angle_velocity += this.angle_acceleration;
    this.angle_velocity = constrain(this.angle_velocity, -0.1, 0.1);
    this.angle += this.angle_velocity;
    
    this.acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    fill(175, 200);
    rectMode(CENTER);
    pushMatrix();
    translate(this.location.x, this.location.y);
    rotate(this.angle);
    rect(0, 0, this.mass * 16, this.mass * 16);
    popMatrix();
  }
}
