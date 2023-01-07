class Path {
  
  ArrayList<PVector> points;
  float radius;
  
  Path() {
    this.points = new ArrayList<PVector>();
    this.radius = 20.0;
  }
  
  void addPoint(float x, float y) {
    PVector point = new PVector(x, y);
    this.points.add(point);
  }
  
  void display() {
    strokeWeight(this.radius * 2);
    stroke(0, 100);
    noFill();
    beginShape();
    for (PVector point: this.points) {
      vertex(point.x, point.y); 
    }
    endShape();
    strokeWeight(1);
    stroke(0);
    beginShape();
    for (PVector point: this.points) {
      vertex(point.x, point.y); 
    }
    endShape();
  }
}
