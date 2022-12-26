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
  for (ParticleSystem system: systems) {
    system.addParticle();
    system.run();
  }
}
