final class Mover {
  
  private PVector location;
  private PVector velocity;
  private PVector acceleration;
  
  public Mover() {
    this.location = new PVector(width/2, height/2);
    this.velocity = new PVector(0, 0);
  }
  
  public void update() {
    this.acceleration = PVector.random2D().mult(random(2));
    this.velocity.add(this.acceleration);
    this.velocity.limit(10);
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


Mover mover;

void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
}
