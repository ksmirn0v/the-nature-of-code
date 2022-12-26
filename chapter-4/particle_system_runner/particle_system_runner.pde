ParticleSystem particleSystem;


void setup() {
  size(800, 600);
  particleSystem = new ParticleSystem(new PVector(width/2, 10));
}


void draw() {
  background(255);
  particleSystem.addParticle();
  particleSystem.run();
}
