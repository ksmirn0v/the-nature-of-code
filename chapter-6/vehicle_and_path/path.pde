class Path {
  
  PVector start;
  PVector end;
  float radius;
  
  Path() {
    this.start = new PVector(0, height/3);
    this.end = new PVector(width, 2*height/3);
    this.radius = 20.0;
  }
  
  void display() {
    strokeWeight(this.radius * 2);
    stroke(0, 100);
    line(this.start.x, this.start.y, this.end.x, this.end.y);
    strokeWeight(1);
    stroke(0);
    line(this.start.x, this.start.y, this.end.x, this.end.y);
  }
}
