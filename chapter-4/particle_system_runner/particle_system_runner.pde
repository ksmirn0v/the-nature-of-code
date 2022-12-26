import java.util.Iterator;


int particle_count = 10;
ArrayList<Particle> particles;


void setup() {
  size(800, 600);
  particles = new ArrayList<Particle>();
}


void draw() {
  background(255);
  particles.add(new Particle(new PVector(width/4 + random(width/2), 10)));
  Iterator<Particle> iterator = particles.iterator();
  while (iterator.hasNext()) {
    Particle particle = iterator.next();
    particle.run();
    if (particle.isDead()) {
      iterator.remove();  
    }
  }
}
