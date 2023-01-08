CellBoard cellBoard;
int resolution = 5;


void setup() {
  size(800, 600);
  
  cellBoard = new CellBoard(width/resolution, height/resolution, resolution);
}


void draw() {
  background(255);
  cellBoard.display();
  cellBoard.computeNextGeneration();
}
