ArrayList<KochLine> kochLines;


void setup() {
  size(800, 600);
  kochLines = new ArrayList<KochLine>();
  PVector start = new PVector(0, 300);
  PVector end = new PVector(width, 300);
  kochLines.add(new KochLine(start, end));
}


void draw() {
  background(255);
  if (mousePressed) {
    generate(); 
  }
  
  for (KochLine kochLine: kochLines) {
    kochLine.display(); 
  }
}


void generate() {
  ArrayList<KochLine> kochLinesNew = new ArrayList<KochLine>();
  for (KochLine kochLine: kochLines) {
    kochLinesNew.add(new KochLine(kochLine.kochA(), kochLine.kochB()));
    kochLinesNew.add(new KochLine(kochLine.kochB(), kochLine.kochC()));
    kochLinesNew.add(new KochLine(kochLine.kochC(), kochLine.kochD()));
    kochLinesNew.add(new KochLine(kochLine.kochD(), kochLine.kochE()));
  }
  kochLines = kochLinesNew;
}
