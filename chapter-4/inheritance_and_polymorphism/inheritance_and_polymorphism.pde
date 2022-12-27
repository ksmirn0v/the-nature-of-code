ArrayList<ParticleSystem> systems;
Repeller repeller;


void setup() {
  size(800, 600);
  systems = new ArrayList<ParticleSystem>();
  repeller = new Repeller(width/2 - 20, height/2);
}


void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}


void draw() {
  background(255);
  PVector gravity = new PVector(0, 0.1);
  repeller.display();
  for (ParticleSystem system: systems) {
    system.applyForce(gravity);
    system.applyRepeller(repeller);
    system.addParticle();
    system.run();
  }
}
