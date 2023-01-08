class CellBoard {
  
  int cols;
  int rows;
  int[][] cells;
  int resolution;
  
  CellBoard(int cols, int rows, int resolution) {
    this.cols = cols;
    this.rows = rows;
    this.initCells();
    this.resolution = resolution;
  }
  
  void initCells() {
    this.cells = new int[this.cols][this.rows];
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        this.cells[i][j] = int(random(2)); 
      }
    }
  }
  
  void computeNextGeneration() {
    int[][] cellsNew = new int[this.cols][this.rows];
    for (int i = 1; i < this.cols - 1; i++) {
      for (int j = 1; j < this.rows - 1; j++) {
        int count = 0;
        for (int ii = -1; ii <= 1; ii++) {
          for (int jj = -1; jj <= 1; jj++) {
            count += this.cells[ii+i][jj+j]; 
          }
        }
        count -= this.cells[i][j];
        
        if (this.cells[i][j] == 1 && count < 2) {
          cellsNew[i][j] = 0; 
        } else if (this.cells[i][j] == 1 && count > 3) {
          cellsNew[i][j] = 0; 
        } else if (this.cells[i][j] == 0 && count == 3) {
          cellsNew[i][j] = 1; 
        } else {
          cellsNew[i][j] = this.cells[i][j]; 
        }
      }
    }
    this.cells = cellsNew;
  }
  
  void display() {
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        if (this.cells[i][j] == 1) {
          fill(0); 
        } else {
          fill(255); 
        }
        stroke(0);
        rect(i*this.resolution, j*this.resolution, this.resolution, this.resolution);
      }
    }
  }
}
