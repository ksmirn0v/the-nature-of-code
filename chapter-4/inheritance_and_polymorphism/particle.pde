class Particle {
  
  PVector location;
  PVector velocity = new PVector(random(-1, 1), random(-2, 0));;
  PVector acceleration = new PVector();
  float lifespan = 255.0;
  float mass;
  
  Particle(PVector location, float mass) {
    this.location = location.copy();
    this.mass = mass;
  }
  
  void applyForce(PVector force) {
    PVector forceAdjusted = PVector.div(force, this.mass);
    this.acceleration.add(forceAdjusted);
  }
  
  void run() {
    this.update();
    this.display();
  }
  
  void update() {
    this.velocity.add(acceleration);
    this.location.add(velocity);
    this.acceleration.mult(0.0);
    this.lifespan -= 2.0;
  }
  
  void display() {
    stroke(0, this.lifespan);
    fill(175, this.lifespan);
    ellipse(this.location.x, this.location.y, 8.0, 8.0);
  }
  
  boolean isDead() {
    return this.lifespan <= 0;
  }
}


class Confetti extends Particle {
  
  Confetti(PVector location, float mass) {
    super(location, mass);
  }
  
  void display() {
    float angle = map(this.location.x, 0, width, 0, TWO_PI);
    
    rectMode(CENTER);
    stroke(0, this.lifespan);
    fill(175, this.lifespan);
    
    pushMatrix();
    translate(this.location.x, this.location.y);
    rotate(angle);
    rect(0.0, 0.0, 8.0, 8.0);
    popMatrix();
  }
}
  
