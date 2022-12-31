class Particle extends VerletParticle2D {
  
  Particle(Vec2D position) {
    super(position);
  }
  
  void display() {
    fill(0, 150);
    stroke(0);
    ellipse(this.x, this.y, 16.0, 16.0);
  }
}
