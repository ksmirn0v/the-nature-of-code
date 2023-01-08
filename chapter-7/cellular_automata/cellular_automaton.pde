class CellularAutomaton {
  
  int[] cells;
  int[] ruleset;
  int resolution;
  int generation = 0;
  
  CellularAutomaton(int resolution) {
    this.resolution = resolution;
    this.initCells();
    this.initRuleset();
  }
  
  void initCells() {
    this.cells = new int[width/this.resolution];
    for (int i = 0; i < this.cells.length; i++) {
      this.cells[i] = 0; 
    }
    this.cells[this.cells.length/2] = 1;
  }
  
  void initRuleset() {
    this.ruleset = new int[]{0, 1, 0, 1, 1, 0, 1, 0};
  }
  
  void computeNextGeneration() {
    int[] cellsNext = new int[this.cells.length];
    for (int i = 1; i < this.cells.length - 1; i++) {
      int valueLeft = this.cells[i-1];
      int valueMiddle = this.cells[i];
      int valueRight = this.cells[i+1];
      int valueNew = applyRule(valueLeft, valueMiddle, valueRight);
      cellsNext[i] = valueNew;
    }
    this.cells = cellsNext;
    this.generation++;
  }
  
  int applyRule(int valueLeft, int valueMiddle, int valueRight) {
    String string = "" + valueLeft + valueMiddle + valueRight;
    int index = Integer.parseInt(string, 2);
    return this.ruleset[index];
  }
  
  void display() {
    for (int i = 0; i < this.cells.length; i++) {
      if (this.cells[i] == 0) {
        fill(255); 
      } else {
        fill(0); 
      }
      stroke(0);
      rect(i*this.resolution, this.generation*this.resolution, this.resolution, this.resolution);
    }
  }
}
