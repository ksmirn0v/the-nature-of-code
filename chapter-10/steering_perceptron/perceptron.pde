class Perceptron {
 
  float[] weights;
  float c = 0.01;
  
  Perceptron(int n, float c) {
    this.weights = new float[n];
    this.c = c;
    for (int i = 0; i < this.weights.length; i++) {
      weights[i] = random(-1, 1); 
    }
  }
  
  PVector feedforward(PVector[] forces) {
    PVector sum = new PVector();
    for (int i = 0; i < this.weights.length; i++) {
      forces[i].mult(this.weights[i]);
      sum.add(forces[i]); 
    }
    return sum;
  }
  
  void train(PVector[] forces, PVector error) {
    for (int i = 0; i < this.weights.length; i++) {
      this.weights[i] += this.c * error.x * forces[i].x;
      this.weights[i] += this.c * error.y * forces[i].y;
      this.weights[i] = constrain(this.weights[i], 0, 1);
    }
  }
}
