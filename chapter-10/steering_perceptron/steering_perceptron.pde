Vehicle v;
PVector desired;
ArrayList<PVector> targets;


void setup() {
  size(640, 360);

  desired = new PVector(width/2,height/2);
  makeTargets();
  v = new Vehicle(targets.size(), random(width), random(height));
}


void makeTargets() {
  targets = new ArrayList<PVector>();
  for (int i = 0; i < 8; i++) {
    targets.add(new PVector(random(width), random(height)));
  }
}


void draw() {
  background(255);

  stroke(0);
  strokeWeight(2);
  fill(0, 100);
  ellipse(desired.x, desired.y, 36, 36);

  for (PVector target : targets) {
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(target.x, target.y, 16, 16);
    line(target.x,target.y-16,target.x,target.y+16);
    line(target.x-16,target.y,target.x+16,target.y);
  }
  
  v.steer(targets);
  v.update();
  v.display();
}


void mousePressed() {
  makeTargets();
}
