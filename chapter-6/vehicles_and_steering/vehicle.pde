class Vehicle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float maxForce;
  float r;
  
  Vehicle(float x, float y) {
    this.location = new PVector(x, y);
    this.velocity = new PVector(0.0, 0.0);
    this.acceleration = new PVector(0.0, 0.0);
    this.maxSpeed = 4.0;
    this.maxForce = 0.1;
    this.r = 3.0;
  }
  
  void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxSpeed);
    this.location.add(this.velocity);
    this.acceleration.mult(0.0);
  }
  
  void applyForce(PVector force) {
    this.acceleration.add(force); 
  }
  
  void seek(PVector target) {
    PVector desiredVelocityDir;
    if (this.location.x < 50.0) {
      desiredVelocityDir = new PVector(this.maxSpeed, this.velocity.y);
    } else if (this.location.x > width - 50.0) {
      desiredVelocityDir = new PVector(-this.maxSpeed, this.velocity.y); 
    } else if (this.location.y < 50.0) {
      desiredVelocityDir = new PVector(this.velocity.x, this.maxSpeed); 
    } else if (this.location.y > height - 50.0) {
      desiredVelocityDir = new PVector(this.velocity.x, -this.maxSpeed); 
    } else {
      desiredVelocityDir = PVector.sub(target, this.location);
      desiredVelocityDir.mult(0.05);
    }
    desiredVelocityDir.limit(this.maxSpeed);
    PVector steerForce = PVector.sub(desiredVelocityDir, this.velocity);
    steerForce.limit(maxForce);
    this.applyForce(steerForce);
  }
  
  void display() {
    float angle = this.velocity.heading2D() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(this.location.x, this.location.y);
    rotate(angle);
    beginShape();
    vertex(0.0, -this.r * 2);
    vertex(-this.r, this.r * 2);
    vertex(this.r, this.r * 2);
    endShape(CLOSE);
    popMatrix();
  }
}
