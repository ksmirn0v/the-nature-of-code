void setup() {
  size(800, 600);
  translate(width/2, height);
  branch(100);
}


void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);
  
  len *= 0.66;
  
  if (len > 2) {
    pushMatrix();
    rotate(PI/6);
    branch(len);
    popMatrix();
  
    pushMatrix();
    rotate(-PI/6);
    branch(len);
    popMatrix();
  }
}
