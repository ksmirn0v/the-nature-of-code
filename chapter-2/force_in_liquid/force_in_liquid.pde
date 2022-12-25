final class Mover {
  
  public PVector location;
  public PVector velocity;
  public PVector acceleration;
  public float mass;
  
  public Mover(float mass, float x, float y) {
    this.location = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.mass = mass;
  }
  
  public void applyForce(PVector force) {
    PVector forceAdjusted = PVector.div(force, mass);
    this.acceleration.add(forceAdjusted);  
  }
  
  public void update() {
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void display() {
    stroke(0);
    fill(175);
    ellipse(this.location.x, this.location.y, this.mass*16, this.mass*16);
  }
  
  public void checkEdges() {
    if (this.location.x > width) {
      this.location.x = 0;
    } else if (this.location.x < 0) {
      this.location.x = width;
    }
    
    if (this.location.y > height) {
      this.velocity.y = -this.velocity.y;
      this.location.y = height;
    }
  }
  
  public boolean isInside(Liquid liquid) {
    return (this.location.x > liquid.x && this.location.x < liquid.x + liquid.w && this.location.y > liquid.y && this.location.y < liquid.y + liquid.h);
  }
  
  public void drag(Liquid liquid) {
    float speed = this.velocity.mag();
    float dragMagnitude = liquid.coef * speed * speed;
    PVector dragForce = this.velocity.copy();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    this.applyForce(dragForce);
  }
}


class Liquid {
  
  public float x;
  public float y;
  public float w;
  public float h;
  public float coef;
  
  Liquid(float x, float y, float w, float h, float coef) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.coef = coef;
  }
  
  void display() {
    noStroke();
    fill(175);
    rect(x, y, w, h);
  }
}


Mover[] movers = new Mover[20];
Liquid liquid;
PVector gravityForce = new PVector(0, 0.1);
PVector windForce = new PVector(1.0, 0);
float friction_coefficient = 0.01;
float drag_coefficient = 0.1;

void setup() {
  size(640, 360);
  liquid = new Liquid(0, height/2, width, height/2, drag_coefficient);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5.0), 0, 0);
  }
}

void draw() {
  background(255);
  liquid.display();
  for (int i = 0; i < movers.length; i++) {
    movers[i].applyForce(new PVector(0, gravityForce.y * movers[i].mass));
    if (mousePressed) {
      movers[i].applyForce(windForce);  
    }
    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);  
    }
    movers[i].applyForce(getFrictionForce(movers[i]));
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

PVector getFrictionForce(Mover mover) {
   PVector frictionForce = mover.velocity.copy();
   frictionForce.mult(-1);
   frictionForce.normalize();
   frictionForce.mult(friction_coefficient);
   return frictionForce;
}
