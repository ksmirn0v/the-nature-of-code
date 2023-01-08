class Vehicle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float maxForce;
  float r;
  
  Vehicle(float x, float y) {
    this.location = new PVector(x, y);
    this.velocity = new PVector(0.0, 0.0);
    this.acceleration = new PVector(0.0, 0.0);
    this.maxSpeed = 4.0;
    this.maxForce = 0.1;
    this.r = 5.0;
  }
  
  void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxSpeed);
    this.location.add(this.velocity);
    this.acceleration.mult(0.0);
  }
  
  void applyForce(PVector force) {
    this.acceleration.add(force); 
  }
  
  PVector seek(PVector target) {
    PVector desiredVelocityDir;
    if (this.location.x < 50.0) {
      desiredVelocityDir = new PVector(this.maxSpeed, this.velocity.y);
    } else if (this.location.x > width - 50.0) {
      desiredVelocityDir = new PVector(-this.maxSpeed, this.velocity.y); 
    } else if (this.location.y < 50.0) {
      desiredVelocityDir = new PVector(this.velocity.x, this.maxSpeed); 
    } else if (this.location.y > height - 50.0) {
      desiredVelocityDir = new PVector(this.velocity.x, -this.maxSpeed); 
    } else {
      desiredVelocityDir = PVector.sub(target, this.location);
      desiredVelocityDir.mult(0.05);
    }
    desiredVelocityDir.limit(this.maxSpeed);
    PVector steerForce = PVector.sub(desiredVelocityDir, this.velocity);
    steerForce.limit(maxForce);
    return steerForce;
  }
  
  PVector separate(ArrayList<Vehicle> vehicles) {
    float separationRadius = this.r * 2;
    PVector totalDiff = new PVector();
    int count = 0;
    for (Vehicle vehicle: vehicles) {
      float distance = PVector.dist(this.location, vehicle.location);
      if (distance > 0 && distance < separationRadius) {
        PVector diff = PVector.sub(location, vehicle.location);
        diff.normalize();
        diff.div(distance);
        totalDiff.add(diff);
        count++;
      }
    }
    if (count > 0) {
      totalDiff.div(count);
      totalDiff.mult(this.maxSpeed);
      PVector steeringForce = PVector.sub(totalDiff, this.velocity);
      steeringForce.limit(this.maxForce);
      return steeringForce;
    }
    return new PVector();
  }
  
  PVector align(ArrayList<Vehicle> vehicles) {
    float maxDistance = 50.0;
    PVector avgVelocity = new PVector();
    int count = 0;
    for (Vehicle vehicle: vehicles) {
      float distance = PVector.dist(this.location, vehicle.location);
      if (distance > 0 && distance < maxDistance) {
        avgVelocity.add(vehicle.velocity);
        count++;
      }
    }
    
    if (count > 0) {
      avgVelocity.div(count);
      avgVelocity.normalize();
      avgVelocity.setMag(this.maxSpeed);
    
      PVector force = PVector.sub(avgVelocity, this.velocity);
      force.limit(this.maxForce);
      return force;
    } else {
      return new PVector(); 
    }
  }
  
  PVector cohere(ArrayList<Vehicle> vehicles) {
    float maxDistance = 50.0;
    PVector avgLocation = new PVector();
    int count = 0;
    for (Vehicle vehicle: vehicles) {
      float distance = PVector.dist(this.location, vehicle.location);
      if (distance > 0 && distance < maxDistance) {
        avgLocation.add(vehicle.location);
        count++;
      }
    }
    
    if (count > 0) {
      avgLocation.div(count);
      return this.seek(avgLocation);
    } else {
      return new PVector(); 
    }
  }
  
  void applyBehaviors(ArrayList<Vehicle> vehicles, PVector target) {
     PVector separationForce = this.separate(vehicles);
     PVector alignmentForce = this.align(vehicles);
     PVector cohesionForce = this.cohere(vehicles);
     PVector steeringForce = this.seek(target);
     
     separationForce.mult(2.0);
     alignmentForce.mult(1.0);
     cohesionForce.mult(1.0);
     steeringForce.mult(1.0);
     
     this.applyForce(separationForce);
     this.applyForce(alignmentForce);
     this.applyForce(cohesionForce);
     this.applyForce(steeringForce);
  }
  
  void display() {
    float angle = this.velocity.heading2D() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(this.location.x, this.location.y);
    rotate(angle);
    beginShape();
    vertex(0.0, -this.r * 2);
    vertex(-this.r, this.r * 2);
    vertex(this.r, this.r * 2);
    endShape(CLOSE);
    popMatrix();
  }
}
