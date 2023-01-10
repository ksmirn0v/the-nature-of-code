class Obstacle {
  
  PVector location;
  float w, h;
  
  Obstacle(float x, float y, float w, float h) {
    this.location = new PVector(x, y);
    this.w = w;
    this.h = h;
  }
  
  boolean contains(PVector other) {
    if (other.x > this.location.x && other.x < this.location.x + this.w && other.y > this.location.y && other.y < this.location.y + this.h) {
      return true; 
    } else {
      return false; 
    }
  }
  
  void display() {
    stroke(0);
    fill(175);
    strokeWeight(2);
    rectMode(CORNER);
    rect(this.location.x, this.location.y, this.w, this.h);
  }
}
