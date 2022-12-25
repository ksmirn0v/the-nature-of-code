final class Mover {
  
  public PVector location;
  public PVector velocity;
  public PVector acceleration;
  public float mass;
  public float coef;
  
  public Mover(float mass, float x, float y) {
    this.location = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.mass = mass;
    this.coef = 0.4;
  }
  
  public void applyForce(PVector force) {
    PVector forceAdjusted = PVector.div(force, mass);
    this.acceleration.add(forceAdjusted);  
  }
  
  public void update() {
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void display() {
    stroke(0);
    fill(175);
    ellipse(this.location.x, this.location.y, this.mass*16, this.mass*16);
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
  
  public PVector attract(Mover mover) {
    PVector force = PVector.sub(this.location, mover.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float strength = (this.coef * this.mass * mover.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}


Mover[] movers = new Mover[20];


void setup() {
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5.0), random(width), random(height));
  }
}


void draw() {
  background(255);
  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i == j) { 
        continue;  
      }
      PVector force = movers[j].attract(movers[i]);
      movers[i].applyForce(force);
    }
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display(); 
  }
}
