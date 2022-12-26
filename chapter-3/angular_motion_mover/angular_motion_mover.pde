Mover[] movers = new Mover[20];


void setup() {
  size(800, 600);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(width/4 + random(width/2), height/4 + random(height/2), random(0.1, 2.0));  
  }
}


void draw() {
  background(255);
  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i == j) {
        continue;  
      }
      PVector gravitational_force = compute_gravitational_force(movers[i], movers[j]);
      movers[i].applyForce(gravitational_force);
    }
    movers[i].update();
    movers[i].display();
  }
}
