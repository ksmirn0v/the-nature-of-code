class DNA {
  
  PVector[] genes;
  float maxForce = 0.1;
  
  DNA() {
    this.genes = new PVector[lifetime];
    for (int i = 0; i < this.genes.length; i++) {
      this.genes[i] = PVector.random2D();
      this.genes[i].mult(random(0.0, this.maxForce));
    }
  }
  
  DNA(PVector[] newgenes) {
    this.genes = newgenes; 
  }
  
  DNA crossover(DNA partner) {
    PVector[] child_genes = new PVector[this.genes.length];
    
    int midpoint = int(random(this.genes.length));
    for (int i = 0; i < this.genes.length; i++) {
      if (i > midpoint) {
        child_genes[i] = this.genes[i]; 
      } else {
        child_genes[i] = partner.genes[i]; 
      }
    }
    DNA child = new DNA(child_genes);
    return child;
  }
  
  void mutate(float mutationRate) {
    for (int i = 0; i < this.genes.length; i++) {
      if (random(1) < mutationRate) {
        this.genes[i] = PVector.random2D();
        this.genes[i].mult(random(0.0, this.maxForce));
      }
    }
  }
}
