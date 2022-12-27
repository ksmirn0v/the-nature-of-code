ArrayList<ParticleSystem> systems;


void setup() {
  size(800, 600);
  systems = new ArrayList<ParticleSystem>();
}


void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY))); 
}


void draw() {
  background(255);
  PVector gravity = new PVector(0, 0.1);
  for (ParticleSystem system: systems) {
    system.applyForce(gravity);
    system.addParticle();
    system.run();
  }
}
