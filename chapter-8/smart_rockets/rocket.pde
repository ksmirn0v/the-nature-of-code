class Rocket {
  
  DNA dna;
  float fitness = 0.0;
  int geneCounter = 0;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float radius;
  boolean hitTarget = false;
  boolean stopped = false;
  
  Rocket(DNA dna, PVector location) {
    this.dna = dna;
    this.location = location.copy();
    this.velocity = new PVector();
    this.acceleration = new PVector();
    this.radius = 4.0;
  }
  
  void applyForce(PVector force) {
    this.acceleration.add(force);
  }
  
  void update() {
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0.0);
  }
  
  void computeFitness() {
    float distance = PVector.dist(this.location, target);
    this.fitness = pow(1/distance, 2);
    if (this.stopped) {
     this.fitness *= 0.1;
    }
  }
  
  void run() {
    this.checkTarget();
    if (!this.hitTarget && !this.stopped) {
      this.applyForce(this.dna.genes[geneCounter]);
      this.geneCounter = (this.geneCounter + 1) % this.dna.genes.length;
      this.update();
    }
    this.display();
  }
  
  void checkTarget() {
    float distance = PVector.dist(this.location, target);
    this.hitTarget = (distance < 12.0);
  }
  
  void collided() {
    for (Obstacle obstacle: obstacles) {
      if (obstacle.contains(this.location)) {
        this.stopped = true; 
      }
    }
  }
  
  void display() {
    float angle = this.velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(this.location.x, this.location.y);
    rotate(angle);
    rectMode(CENTER);
    fill(0);
    rect(-this.radius/2, this.radius*2, this.radius/2, this.radius);
    rect(this.radius/2, this.radius*2, this.radius/2, this.radius);
    fill(175);
    beginShape(TRIANGLES);
    vertex(0, -this.radius*2);
    vertex(-this.radius, this.radius*2);
    vertex(this.radius, this.radius*2);
    endShape();
    popMatrix();
  }
}
