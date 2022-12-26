import java.util.Iterator;


class ParticleSystem {
  
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector origin) {
    this.origin = origin.copy();
    this.particles = new ArrayList<Particle>();
  }
  
  void addParticle() {
    this.particles.add(new Particle(this.origin)); 
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
