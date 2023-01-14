class Perceptron {
 
  float[] weights;
  float c = 0.01;
  
  Perceptron(int n) {
    this.weights = new float[n];
    for (int i = 0; i < this.weights.length; i++) {
      weights[i] = random(-1, 1); 
    }
  }
  
  int feedforward(float[] inputs) {
    float sum = 0;
    for (int i = 0; i < this.weights.length; i++) {
      sum += inputs[i] * this.weights[i]; 
    }
    return activate(sum);
  }
  
  int activate(float value) {
    return value > 0 ? 1 : -1;
  }
  
  void train(float[] inputs, int desired) {
    int guess = this.feedforward(inputs);
    float error = desired - guess;
    for (int i = 0; i < this.weights.length; i++) {
      this.weights[i] += c * error * inputs[i]; 
    }
  }
}
