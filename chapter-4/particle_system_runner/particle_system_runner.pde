Particle particle;


void setup() {
  size(800, 600);
  particle = new Particle(new PVector(width/2, 10));
  smooth();
}


void draw() {
  background(255);
  particle.run();
  if (particle.isDead()) {
    println("Particle is dead");
  }
}
