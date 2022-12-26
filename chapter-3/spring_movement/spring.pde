class Spring {
  
  PVector origin;
  float rest_length;
  float k = 0.01;
  
  Spring(float xPos, float yPos, float rest_length) {
    this.origin = new PVector(xPos, yPos);
    this.rest_length = rest_length;
  }
  
  void connect(Mover mover) {
    PVector force = PVector.sub(mover.location, this.origin);
    float distance = force.mag();
    float stretch = distance - this.rest_length;
    force.normalize();
    force.mult(-1 * k * stretch);
    mover.applyForce(force);
  }
  
  void display() {
    fill(100);
    rectMode(CENTER);
    rect(this.origin.x, this.origin.y, 10, 10);
    stroke(0);
    line(mover.location.x, mover.location.y, this.origin.x, this.origin.y);
  }
}
