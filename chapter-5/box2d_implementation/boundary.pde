class Boundary {
  
  Body body;
  float objWidth;
  float objHeight;
  
  Boundary(float xPos, float yPos, float objWidth, float objHeight) {
    
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    
    BodyDef bodyDef = new BodyDef();
    Vec2 position = box2d.coordPixelsToWorld(xPos, yPos);
    bodyDef.position.set(position);
    bodyDef.type = BodyType.STATIC;
    
    this.body = box2d.createBody(bodyDef);
    
    PolygonShape polygonShape = new PolygonShape();
    float shapeWidth = box2d.scalarPixelsToWorld(objWidth/2);
    float shapeHeight = box2d.scalarPixelsToWorld(objHeight/2);
    polygonShape.setAsBox(shapeWidth, shapeHeight);
    
    this.body.createFixture(polygonShape, 1.0);
  }
  
  void display() {
    Vec2 position = box2d.getBodyPixelCoord(this.body);
    fill(0.0);
    stroke(0.0);
    rectMode(CENTER);
    rect(position.x, position.y, this.objWidth, this.objHeight);
  }
}
