float angle = 0;
float angle_velocity = 0.2;
float amplitude = 100;

size(400, 200);
background(255);

stroke(0);
strokeWeight(2);
noFill();

beginShape();
for (int x = 0; x <= width; x += 5) {
  float y = map(sin(angle), -1, 1, 0, height);
  vertex(x, y);
  angle += angle_velocity;
}
endShape();
