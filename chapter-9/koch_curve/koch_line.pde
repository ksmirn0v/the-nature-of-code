class KochLine {
  
  PVector start;
  PVector end;
  
  KochLine(PVector start, PVector end) {
    this.start = start.copy();
    this.end = end.copy();
  }
  
  PVector kochA() {
    return this.start.copy(); 
  }
  
  PVector kochB() {
    PVector diff = PVector.sub(this.end, this.start);
    diff.div(3);
    diff.add(this.start);
    return diff;
  }
  
  PVector kochC() {
    PVector startCopy = this.start.copy();
    PVector diff = PVector.sub(this.end, this.start);
    diff.div(3);
    startCopy.add(diff);
    diff.rotate(-radians(60));
    startCopy.add(diff);
    return startCopy;
  }
  
  PVector kochD() {
    PVector diff = PVector.sub(this.end, this.start);
    diff.mult(2.0/3.0);
    diff.add(this.start);
    return diff;
  }
  
  PVector kochE() {
    return this.end.copy(); 
  }
  
  void display() {
    stroke(0);
    line(this.start.x, this.start.y, this.end.x, this.end.y);
  }
}
