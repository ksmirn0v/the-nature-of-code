import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;


VerletPhysics2D physics;
Cluster cluster;
VerletParticle2D attractor;
float spring_length = 100.0;
int node_count = 20;
float spring_strength = 0.01;


void setup() {
  size(640, 360);
  
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  
  cluster = new Cluster(node_count, spring_length, new Vec2D(width/2, height/2));
  
  for (Node node: cluster.nodes) {
    physics.addParticle(node);
  }
  
  for (int i = 0; i < cluster.nodes.size() - 1; i++) {
    VerletParticle2D node_source = cluster.nodes.get(i);
    for (int j = i + 1; j < cluster.nodes.size(); j++) {
      VerletParticle2D node_target = cluster.nodes.get(j);
      physics.addSpring(new VerletSpring2D(node_source, node_target, spring_length, spring_strength));
    }
  }
  
  attractor = new VerletParticle2D(new Vec2D(width/2, height/2));
  float attraction_distance = height;
  float attraction_strength = 1.0;
  AttractionBehavior2D behavior = new AttractionBehavior2D(attractor, attraction_distance, attraction_strength);
  physics.addBehavior(behavior);
  attractor.lock();
}


void draw() {
  physics.update();
  
  background(255);
  cluster.display();
}
