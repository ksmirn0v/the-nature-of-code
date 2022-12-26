class Oscillator {
  
  PVector angle;
  PVector velocity;
  PVector amplitude;
  
  Oscillator() {
    this.angle = new PVector();
    this.velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    this.amplitude = new PVector(random(width/2), random(height/2));
  }
  
  void oscillate() {
    this.angle.add(velocity);  
  }
  
  void display() {
    float x = this.amplitude.x * sin(this.angle.x);
    float y = this.amplitude.y * sin(this.angle.y);
    pushMatrix();
    translate(width/2, height/2);
    stroke(0);
    fill(175);
    line(0, 0, x, y);
    ellipse(x, y, 16, 16);
    popMatrix();
  }
}
