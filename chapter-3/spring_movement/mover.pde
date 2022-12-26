class Mover {
  
  PVector location;
  PVector velocity = new PVector(0 , 0);
  PVector acceleration = new PVector(0, 0);
  
  float mass;
  
  Mover(float xPos, float yPos, float mass) {
    this.location = new PVector(xPos, yPos);
    this.mass = mass;
  }
  
  void startMovement() {
    this.update();
    this.display();
  }
  
  void applyForce(PVector force) {
    PVector forceAdjusted = PVector.div(force, this.mass);
    this.acceleration.add(forceAdjusted);
  }
  
  void update() {
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0.0);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(this.location.x, this.location.y, this.mass * 16, this.mass * 16);  
  }
}
