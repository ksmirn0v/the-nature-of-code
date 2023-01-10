class Population {
 
  float mutationRate;
  Rocket[] population;
  ArrayList<Rocket> matingPool;
  int generations;
  
  Population(float mutationRate, int popSize) {
    this.mutationRate = mutationRate;
    this.population = new Rocket[popSize];
    this.matingPool = new ArrayList<Rocket>();
    this.generations = 0;
    for (int i = 0; i < popSize; i++) {
      PVector position = new PVector(width/2, height+20);
      this.population[i] = new Rocket(new DNA(), position); 
    }
  }
  
  void computeFitness() {
    for (int i = 0; i < this.population.length; i++) {
      this.population[i].computeFitness(); 
    }
  }
  
  float computeMaxFitness() {
    float record = 0;
    for (int i = 0; i < this.population.length; i++) {
      if (this.population[i].fitness > record) {
        record = this.population[i].fitness; 
      }
    }
    return record;
  }
  
  void doSelection() {
    this.matingPool.clear();
    
    float maxFitness = computeMaxFitness();
    
    for (int i = 0; i < this.population.length; i++) {
      float fitnessNormalized = map(this.population[i].fitness, 0, maxFitness, 0, 1);
      int n = int(fitnessNormalized * 100);
      for (int j = 0; j < n; j++) {
        this.matingPool.add(this.population[i]); 
      }
    }
  }
  
  void doReproduction() {
    for (int i = 0; i < this.population.length; i++) {
      int idx1 = int(random(this.matingPool.size()));
      int idx2 = int(random(this.matingPool.size()));
      
      Rocket parent1 = this.matingPool.get(idx1);
      Rocket parent2 = this.matingPool.get(idx2);
      
      DNA parent1Genes = parent1.dna;
      DNA parent2Genes = parent2.dna;
      
      DNA child = parent1Genes.crossover(parent2Genes);
      child.mutate(this.mutationRate);
      
      PVector position = new PVector(width/2, height+20);
      this.population[i] = new Rocket(child, position);
    }
    this.generations++;
  }
  
  void live() {
    for (int i = 0; i < this.population.length; i++) {
      this.population[i].run(); 
    }
  }
}
