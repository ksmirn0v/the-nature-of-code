class Pendulum {
  
  PVector origin;
  PVector location = new PVector();
  float arm_length = 125.0;
  float angle = PI/4;
  float angular_velocity = 0.0;
  float angular_acceleration = 0.0;
  float damping = 0.995;
  
  Pendulum(PVector origin, float arm_length) {
    this.origin = origin.copy();
    this.arm_length = arm_length;
  }
  
  void update() {
    float gravity = 0.4;
    this.angular_acceleration = -1 * gravity * sin(this.angle) / this.arm_length;
    this.angular_velocity += this.angular_acceleration;
    this.angle += this.angular_velocity;
    this.angular_velocity *= this.damping;
  }
  
  void display() {
    location.set(this.arm_length * sin(this.angle), this.arm_length * cos(this.angle), 0);
    location.add(origin);
    
    stroke(0);
    fill(175);
    line(origin.x, origin.y, location.x, location.y);
    ellipse(location.x, location.y, 16, 16);
  }
}
