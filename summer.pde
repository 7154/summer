import controlP5.*;
import java.util.ListIterator;
 
ControlP5 ui;
PGraphics pg;
 
float x1,y1,x2,y2,xe,ye;
float angle1;
float angle2;
float the1;
float the2;
final float l1 = 150;
final float l2 = 100;
final int r = 2;
int dir = 1;
 
void setup(){
  size(640,640);
  stroke(0,0,0);
  fill(0,0,0);
  ui = new ControlP5(this);
   
  ui.addSlider("angle1")
     .setPosition(10,10)
     .setSize(200,20)
     .setRange(0,180)
     .setValue(0);
  ui.addSlider("angle2")
     .setPosition(10,50)
     .setSize(200,20)
     .setRange(0,180)
     .setValue(0);   
  //set to origin.
  x1 = 300;
  y1 = 350;
  pg = createGraphics(width,height,JAVA2D);
   
}
 
void draw()
{
  background(255,255,255);
  the1 = angle1*PI/90;
  the2 = angle2*PI/90;
  ellipse(x1,y1,r,r);
  x2 = x1+l1*cos(the1);
  y2 = y1+l1*sin(the1);
  xe = x2+l2*cos(the2+the1);
  ye = y2+l2*sin(the2+the1);
  ellipse(x2,y2,r,r);
  ellipse(xe,ye,r,r);
  line(x1,y1,x2,y2);
  line(x2,y2,xe,ye);
  pg.beginDraw();
    pg.noStroke();
    pg.fill(0,100,100);
    pg.ellipse(xe,ye,r,r);
  pg.endDraw();
}
