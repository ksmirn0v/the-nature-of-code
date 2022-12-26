class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector location) {
    this.location = location.copy();
    this.velocity = new PVector(random(-1, 1), random(-2, 0));
    this.acceleration = new PVector(0, 0.05);
    this.lifespan = 255.0;   
  }
  
  void run() {
    this.update();
    this.display();
  }
  
  void update() {
    this.velocity.add(acceleration);
    this.location.add(velocity);
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
  
