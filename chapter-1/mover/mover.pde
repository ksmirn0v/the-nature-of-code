final class Mover {
  
  private PVector location;
  private PVector velocity;
  private PVector acceleration;
  
  public Mover() {
    this.location = new PVector(random(width), random(height));
    this.velocity = new PVector(0, 0);
  }
  
  public void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(mouse, this.location);
    direction.normalize();
    direction.mult(0.5);
    this.acceleration = direction;
    this.velocity.add(this.acceleration);
    this.velocity.limit(5);
    this.location.add(this.velocity);
  }
  
  public void display() {
    stroke(0);
    fill(175);
    ellipse(this.location.x, this.location.y, 16, 16);
  }
  
  public void checkEdges() {
    if (this.location.x > width) {
      this.location.x = 0;
    } else if (this.location.x < 0) {
      this.location.x = width;
    }
    
    if (this.location.y > height) {
      this.location.y = 0;
    } else if (this.location.y < 0) {
      this.location.y = height;
    }
  }
}


Mover[] movers = new Mover[20];

void setup() {
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();  
  }
}

void draw() {
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}
