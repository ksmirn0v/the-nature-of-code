class Repeller {
  
  PVector location;
  float radius = 10.0;
  float strength = 100.0;
  
  Repeller(float xPos, float yPos) {
    this.location = new PVector(xPos, yPos);
  }
  
  void display() {
    stroke(0);
    fill(0);
    ellipse(this.location.x, this.location.y, this.radius * 2, this.radius * 2);
  }
  
  PVector repel(Particle particle) {
    PVector direction = PVector.sub(this.location, particle.location);
    float distance = direction.mag();
    direction.normalize();
    distance = constrain(distance, 5.0, 100.0);
    float force = -1 * this.strength / (distance * distance);
    direction.mult(force);
    return direction;
  }
}
