class Cluster {
 
  ArrayList<Node> nodes;
  float diameter;
  
  Cluster(int node_count, float diameter, Vec2D center) {
    this.nodes = new ArrayList<Node>();
    this.diameter = diameter;
    for (int i = 0; i < node_count; i++) {
      nodes.add(new Node(center.add(Vec2D.randomVector()))); 
    }
  }
  
  void display() {
    for (Node node: nodes) {
      node.display(); 
    }
    
    for (int i = 0; i < this.nodes.size() - 1; i++) {
      Node node_source = this.nodes.get(i);
      for (int j = i + 1; j < this.nodes.size(); j++) {
        Node node_target = this.nodes.get(j);
        stroke(0);
        line(node_source.x, node_source.y, node_target.x, node_target.y);
      }
    }
  }
}
