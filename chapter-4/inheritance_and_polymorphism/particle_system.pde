import java.util.Iterator;


class ParticleSystem {
  
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector origin) {
    this.origin = origin.copy();
    this.particles = new ArrayList<Particle>();
  }
  
  void addParticle() {
    float choice = random(1);
    if (choice < 0.5) {
      this.particles.add(new Particle(this.origin));
    } else {
      this.particles.add(new Confetti(this.origin)); 
    }
  }
  
  void run() {
     Iterator<Particle> iterator = this.particles.iterator();
     while (iterator.hasNext()) {
       Particle particle = iterator.next();
       particle.run();
       if (particle.isDead()) {
          iterator.remove(); 
       }
     }
  }
}
