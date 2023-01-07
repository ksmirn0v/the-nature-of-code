class FlowField {
  
  PVector[][] field;
  int rows;
  int cols;
  int resolution;
  
  FlowField() {
    resolution = 40;
    rows = height/resolution;
    cols = width/resolution;
    field = new PVector[cols][rows];
    this.generate();
  }
  
  void generate() {
    float xoff = 0.0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0.0;
      for (int j = 0; j < rows; j++) {
        float angle = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector(cos(angle), sin(angle));
        yoff += 0.1;
      }
    }
    xoff += 0.1;
  }
  
  PVector lookup(PVector location) {
    int column = int(constrain(location.x/this.resolution, 0, this.cols - 1));
    int row = int(constrain(location.y/this.resolution, 0, this.rows - 1));
    return this.field[column][row].copy();
  }
}
