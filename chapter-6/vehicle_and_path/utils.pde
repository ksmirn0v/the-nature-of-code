PVector getNormalPoint(PVector target, PVector start, PVector end) {
  PVector target_start = PVector.sub(target, start);
  PVector target_end = PVector.sub(target, end);
  target_end.normalize();
  target_end.mult(target_start.dot(target_end));
  PVector normalPoint = PVector.add(start, target_end);
  return normalPoint;
}
