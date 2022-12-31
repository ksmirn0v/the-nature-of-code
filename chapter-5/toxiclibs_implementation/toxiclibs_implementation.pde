import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;


VerletPhysics2D physics;
Particle particle1;
Particle particle2;
VerletSpring2D spring;


void setup() {
  size(640, 360);
  
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  
  particle1 = new Particle(new Vec2D(100, 20));
  particle2 = new Particle(new Vec2D(100, 180));
  particle1.lock();
  
  float len = 80.0;
  float strength = 0.01;
  spring = new VerletSpring2D(particle1, particle2, len, strength);
  
  physics.addParticle(particle1);
  physics.addParticle(particle2);
  physics.addSpring(spring);
}


void draw() {
  physics.update();
  
  background(255);
  line(particle1.x, particle1.y, particle2.x, particle2.y);
  particle1.display();
  particle2.display();
  
  if (mousePressed) {
    particle2.lock();
    particle2.x = mouseX;
    particle2.y = mouseY;
    particle2.unlock();
  }
}
