int[] randomCounts;

void setup() {
  size(640, 240);
  randomCounts = new int[20];
}

void draw() {
  background(255);
  
  int index = int(random(randomCounts.length));
  randomCounts[index]++;
  
  stroke(0);
  fill(175);
  
  int barWidth = width/randomCounts.length;
  for (int barIndex = 0; barIndex < randomCounts.length; barIndex++) {
    rect(barIndex*barWidth, height-randomCounts[barIndex], barWidth-1, randomCounts[barIndex]);  
  }
}
