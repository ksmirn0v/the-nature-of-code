class Trainer {
 
  float[] inputs;
  int answer;
  
  Trainer(float x, float y, int a) {
    this.inputs = new float[3];
    this.inputs[0] = x;
    this.inputs[1] = y;
    this.inputs[2] = 1;
    this.answer = a;
  }
}
