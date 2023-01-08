int resolution = 10;
CellularAutomaton cellularAutomaton;


void setup() {
  size(1240, 800);
  
  cellularAutomaton = new CellularAutomaton(resolution);
  for (int i = 0; i < height/resolution; i++) {
    cellularAutomaton.display();
    cellularAutomaton.computeNextGeneration();
  }
}
