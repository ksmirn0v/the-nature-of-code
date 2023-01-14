Perceptron ptron;
Trainer[] training = new Trainer[2000];
int count = 0;


float f(float x) {
  return 2*x + 1; 
}


void setup() {
  size(400, 400);
  ptron = new Perceptron(3);
  for (int i = 0; i < training.length; i++) {
    float x = random(-width/2, width/2);
    float y = random(-height/2, height/2);
    int answer = 1;
    if (y < f(x)) {
      answer = -1; 
    }
    training[i] = new Trainer(x, y, answer);
  }
}


void draw() {
  background(255);
  stroke(0);
  translate(width/2, height/2);
  line(-width/2, f(-width/2), width/2, f(width/2));
  ptron.train(training[count].inputs, training[count].answer);
  count = (count + 1) % training.length;
  for (int i = 0; i < count; i++) {
    int guess = ptron.feedforward(training[i].inputs);
    if (guess > 0) {
      noFill(); 
    } else {
      fill(0); 
    }
    ellipse(training[i].inputs[0], training[i].inputs[1], 8, 8);
  }
}
