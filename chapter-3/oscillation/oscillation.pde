Oscillator oscillator;


void setup() {
  size(640, 360);  
  oscillator = new Oscillator();
}


void draw() {
  background(255);
  oscillator.oscillate();
  oscillator.display();
}
