import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;


class Box {
  
  Body body;
  float objWidth = 16.0;
  float objHeight = 16.0;
  
  Box(float xPos, float yPos) {
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
    float shapeWidth = box2d.scalarPixelsToWorld(this.objWidth/2);
    float shapeHeight = box2d.scalarPixelsToWorld(this.objHeight/2);
    polygonShape.setAsBox(shapeWidth, shapeHeight);
    
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
    
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0.0, 0.0, this.objWidth, this.objHeight);
    popMatrix();
  }
  
  void killBody() {
    box2d.destroyBody(this.body); 
  }
}
