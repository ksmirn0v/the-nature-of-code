final class Mover {
  
  private PVector location;
  private PVector velocity;
  private PVector acceleration;
  
  public Mover() {
    this.location = new PVector(random(width), random(height));
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
  }
  
  public void applyForce(PVector force) {
    this.acceleration.add(force);  
  }
  
  public void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(10);
    this.location.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void display() {
    stroke(0);
    fill(175);
    ellipse(this.location.x, this.location.y, 16, 16);
  }
  
  public void checkEdges() {
    if (this.location.x > width) {
      this.location.x = 0;
    } else if (this.location.x < 0) {
      this.location.x = width;
    }
    
    if (this.location.y > height) {
      this.location.y = 0;
    } else if (this.location.y < 0) {
      this.location.y = height;
    }
  }
}


Mover mover;
PVector gravityForce = new PVector(0, 0.1);
PVector windForce = new PVector(1.0, 0);

void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  background(255);
  mover.applyForce(gravityForce);
  if (mousePressed) {
    mover.applyForce(windForce);  
  }
  mover.update();
  mover.checkEdges();
  mover.display();
}
