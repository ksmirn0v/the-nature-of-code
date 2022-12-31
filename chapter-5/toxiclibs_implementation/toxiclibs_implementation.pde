import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;


VerletPhysics2D physics;
ArrayList<Particle> particles;
float spring_length = 10.0;
int particle_count = 20;
float spring_strength = 0.01;


void setup() {
  size(640, 360);
  
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < particle_count; i++) {
    Particle particle = new Particle(new Vec2D((float) (i * spring_length), 10.0));
    physics.addParticle(particle);
    particles.add(particle);
    if (i != 0) {
      Particle previous_particle = particles.get(i-1);
      VerletSpring2D spring = new VerletSpring2D(particle, previous_particle, spring_length, spring_strength);
      physics.addSpring(spring);
    }
  }
  
  Particle head_particle = particles.get(0);
  head_particle.lock();
}


void draw() {
  physics.update();
  
  background(255);
  
  noFill();
  beginShape();
  for (Particle particle: particles) {
    vertex(particle.x, particle.y);
  }
  endShape();
  
  for (Particle particle: particles) {
    particle.display(); 
  }
  
  if (mousePressed) {
    particles.get(particle_count - 1).lock();
    particles.get(particle_count - 1).x = mouseX;
    particles.get(particle_count - 1).y = mouseY;
    particles.get(particle_count - 1).unlock();
  }
}
