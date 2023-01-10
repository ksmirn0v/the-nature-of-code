int generation = 0;
String target = "to be or not to be";
int totalPopulation = 100;
DNA[] population = new DNA[totalPopulation];
ArrayList<DNA> matingPool = new ArrayList<DNA>();


void setup() {
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA(); 
  }
}


void draw() {
  if (mousePressed) {
    float bestFitness = 0;
    DNA bestGuess = null;
    
    matingPool = new ArrayList<DNA>();
    for (int i = 0; i < population.length; i++) {
      population[i].computeFitness();
      if (population[i].fitness > bestFitness) {
        bestFitness = population[i].fitness;
        bestGuess = population[i];
      }
      
      int n = int(population[i].fitness * 100);
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]); 
      }
    }
    
    println(generation + ": " + bestGuess.getPhrase() + " = " + bestFitness);
    
    for (int i = 0; i < population.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
    
      DNA parentA = matingPool.get(a);
      DNA parentB = matingPool.get(b);
    
      DNA child = parentA.crossover(parentB);
      child.mutate();
      
      population[i] = child;
    }
    
    generation++;
  }
}
