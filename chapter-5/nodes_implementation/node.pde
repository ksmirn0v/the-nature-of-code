class Node extends VerletParticle2D {
  
  Node(Vec2D position) {
    super(position); 
  }
  
  void display() {
    fill(0, 150);
    stroke(0);
    ellipse(this.x, this.y, 16.0, 16.0);
  }
}
