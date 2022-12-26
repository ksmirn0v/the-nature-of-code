int particle_count = 10;
ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
  size(800, 600);
  for (int i = 0; i < particle_count; i++) {
    particles.add(new Particle(new PVector(width/4 + random(width/2), 10)));
  }
  smooth();
}


void draw() {
  background(255);
  for (Particle particle: particles) {
      if (particle.isDead()) {
        println("Particle is dead");
      }  
      particle.run();
  }
}
