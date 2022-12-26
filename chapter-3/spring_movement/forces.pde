PVector compute_gravity_force(Mover mover) {
  PVector force = new PVector(0, 0.7);
  force.mult(mover.mass);
  return force;
}
