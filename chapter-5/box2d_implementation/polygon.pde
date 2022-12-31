class Polygon extends Box {
  
  Body body;
  float objWidth = 16.0;
  float objHeight = 16.0;
  
  Polygon(float xPos, float yPos) {
    super(xPos, yPos);
  }
  
  void initialize(float xPos, float yPos) {
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.DYNAMIC;
    Vec2 position = box2d.coordPixelsToWorld(xPos, yPos);
    bodyDef.position.set(position);
    bodyDef.fixedRotation = true;
    bodyDef.linearDamping = 0.8;
    bodyDef.angularDamping  = 0.9;
    bodyDef.bullet = true;
    
    this.body = box2d.createBody(bodyDef);
    this.body.setLinearVelocity(new Vec2(0,3));
    this.body.setAngularVelocity(1.2);
    
    PolygonShape polygonShape = new PolygonShape();
    Vec2[] vertices = new Vec2[4];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-15.0, 25.0));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(15.0, 0.0));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(20.0, -15.0));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(-10.0, -10.0));
    polygonShape.set(vertices, vertices.length);
    
    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.shape = polygonShape;
    fixtureDef.friction = 0.3;
    fixtureDef.restitution = 0.5;
    fixtureDef.density = 1.0;
    
    this.body.createFixture(fixtureDef);
  }
  
  void display() {
    Vec2 position = box2d.getBodyPixelCoord(this.body);
    float angle = -this.body.getAngle();
    
    Fixture fixture = this.body.getFixtureList();
    PolygonShape polygonShape = (PolygonShape) fixture.getShape();
    
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    fill(175);
    stroke(0);
    rectMode(CENTER);
    beginShape();
    for (int i = 0; i < polygonShape.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(polygonShape.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  void killBody() {
    box2d.destroyBody(this.body); 
  }
}
