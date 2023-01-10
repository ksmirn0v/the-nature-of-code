class DNA {
  
  char[] genes = new char[18];
  float fitness;
  float mutationRate = 0.01;
  
  DNA() {
    for (int i = 0; i < this.genes.length; i++) {
      this.genes[i] = (char) random(32, 128); 
    }
  }
  
  void computeFitness() {
    int score = 0;
    for (int i = 0; i < this.genes.length; i++) {
      if (this.genes[i] == target.charAt(i)) {
        score++; 
      }
    }
    this.fitness = float(score)/target.length();
  }
  
  DNA crossover(DNA partner) {
    DNA child = new DNA();
    
    int midpoint = int(random(this.genes.length));
    for (int i = 0; i < this.genes.length; i++) {
      if (i > midpoint) {
        child.genes[i] = this.genes[i]; 
      } else {
        child.genes[i] = partner.genes[i]; 
      }
    }
    return child;
  }
  
  void mutate() {
    for (int i = 0; i < this.genes.length; i++) {
      if (random(1) < mutationRate) {
        this.genes[i] = (char) random(32, 128); 
      }
    }
  }
  
  String getPhrase() {
    return new String(this.genes); 
  }
}
