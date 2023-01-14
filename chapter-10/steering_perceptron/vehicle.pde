class Vehicle {
  
  Perceptron brain;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float maxForce;
  float r = 5.0;
  
  Vehicle(int n, float x, float y) {
    this.brain = new Perceptron(n, 0.001);
    this.location = new PVector(x, y);
    this.velocity = new PVector(0.0, 0.0);
    this.acceleration = new PVector(0.0, 0.0);
    this.maxSpeed = 4.0;
    this.maxForce = 0.1;
  }
  
  void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxSpeed);
    this.location.add(this.velocity);
    this.acceleration.mult(0.0);
    
    this.location.x = constrain(this.location.x, 0, width);
    this.location.y = constrain(this.location.y, 0, height);
  }
  
  void applyForce(PVector force) {
    this.acceleration.add(force); 
  }
  
  void steer(ArrayList<PVector> targets) {
    PVector[] forces = new PVector[targets.size()];
    
    for (int i = 0; i < forces.length; i++) {
      forces[i] = this.seek(targets.get(i)); 
    }
    PVector result = brain.feedforward(forces);
    this.applyForce(result);
    
    PVector desired = new PVector(width/2, height/2);
    PVector error = PVector.sub(desired, this.location);
    this.brain.train(forces, error);
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, this.location);
    desired.normalize();
    desired.mult(this.maxSpeed);
    PVector steer = PVector.sub(desired, this.velocity);
    steer.limit(this.maxForce);
    return steer;
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
