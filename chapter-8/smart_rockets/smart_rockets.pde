int lifetime;
int lifeCounter;
Population population;
PVector target;


void setup() {
  size(640, 360);
  lifetime = height;
  lifeCounter = 0;
  target = new PVector(width/2, 24);
  float mutationRate = 0.01;
  population = new Population(mutationRate, 50);
}


void draw() {
  background(255);
  
  fill(0);
  ellipse(target.x, target.y, 24, 24);
  
  if (lifeCounter < lifetime) {
    population.live();
    lifeCounter++;
  } else {
    lifeCounter = 0;
    population.computeFitness();
    population.doSelection();
    population.doReproduction();
  }
  
  fill(0);
  text("Generation #: " + population.generations, 10, 18);
  text("Cycles left: " + (lifetime - lifeCounter), 10, 36);
}


void mousePressed() {
  target.x = mouseX;
  target.y = mouseY;
}
