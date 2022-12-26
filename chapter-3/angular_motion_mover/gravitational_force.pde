PVector compute_gravitational_force(Mover mover1, Mover mover2) {
  PVector direction = PVector.sub(mover2.location, mover1.location);
  float distance = constrain(direction.mag(), 5.0, 25.0);
  direction.normalize();
  float strength = (0.4 * mover1.mass * mover2.mass) / (distance * distance);
  return direction.mult(strength);
}

PVector compute_gravitational_force_towards_center(Mover mover) {
  PVector direction = PVector.sub(new PVector(width/2, height/2), mover.location);
  float distance = constrain(direction.mag(), 5.0, 25.0);
  direction.normalize();
  float strength = (0.4 * mover.mass * 10.0) / (distance * distance);
  return direction.mult(strength);
}
