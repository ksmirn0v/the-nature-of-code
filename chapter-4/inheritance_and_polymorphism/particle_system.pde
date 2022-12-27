import java.util.Iterator;


class ParticleSystem {
  
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector origin) {
    this.origin = origin.copy();
    this.particles = new ArrayList<Particle>();
  }
  
  void applyForce(PVector force) {
    for (Particle particle: this.particles) {
      particle.applyForce(force);  
    }
  }
  
  void applyRepeller(Repeller repeller) {
    for (Particle particle: this.particles) {
       PVector force = repeller.repel(particle);
       particle.applyForce(force);
    }
  }
  
  void addParticle() {
    float choice = random(1);
    if (choice < 0.5) {
      this.particles.add(new Particle(this.origin, 1.0));
    } else {
      this.particles.add(new Confetti(this.origin, 1.0)); 
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
