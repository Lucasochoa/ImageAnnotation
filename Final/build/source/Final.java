import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Final extends PApplet {

AppDelegate app;
PhotoCapture photoCapture1;
UserDefinedObject tempObj;
PImage photo1;
PImage photo2;
PImage photo3;

int w,h;

public void setup(){
  
  
  appDelegateSetup();
  tempLoadImage();
  tempLoadObj();

  //app = new AppDelegate()
}
public void draw(){
  photoCapture1.draw();
  //app.draw();
}
public void appDelegateSetup(){
  app = new AppDelegate();
  app.addButton(50,50,50,50);
  app.addButton(50,50,110,50);
}

public void tempLoadObj(){
  tempObj = new UserDefinedObject("henry");
  photoCapture1.definedObjects.add(tempObj);
}

public void tempLoadImage(){
  photo1 = loadImage("images/photo1.png");
  photo1.resize(400,700);
  photoCapture1 = new PhotoCapture();
  photoCapture1.setImage(photo1);
}

public void keyPressed() {
  if (key == 'n'){
    println("new user defined object incoming");
    tempLoadObj();
  }
  if (key == CODED){
    if(keyCode == RIGHT) println("right button");
    if (keyCode == LEFT) println("left button");
  }
}

public void mousePressed() {
  photoCapture1.definedObjects.get(photoCapture1.definedObjects.size()-1).points.add(new PVector(mouseX,mouseY));
  photoCapture1.definedObjects.get(photoCapture1.definedObjects.size()-1).setShape();
  println(tempObj.points);

  //tempbuttonhandeler
  app.checkButtons();




  //game.mouseDragged(mouseX, mouseY);
}
class AppDelegate{
  private ArrayList<PhotoCapture> annotatedCaptures;
  private ArrayList<Button> buttons;
  //private ArrayList<Scenes
  int width, height;
//contstructor
  AppDelegate(){
    annotatedCaptures = new ArrayList<PhotoCapture>();
    buttons = new ArrayList<Button>();
    this.width = 400;
    this.height = 600;
  }
//getters and setters
  public void addPhotoCapture(PhotoCapture p){
    this.annotatedCaptures.add(p);
  }
  public void addButton(int width,int height,int x,int y){
    this.buttons.add(new Button(width,height,x,y));
  }
//loop checkers
  public void checkButtons(){
    for (Button b: buttons){
      b.isButtonClicked();
    }
  }


  public void draw(){
    for (Button b: buttons){
      b.draw();
    }
  }

}
class Button{
protected int width,height,x,y;
protected int col;

Button(int width,int height,int x,int y){
  this.width = width;
  this.height = height;
  this.x = x;
  this.y = y;
}

protected void draw(){
  fill(color(255,0,0));
  rectMode(CENTER);
  rect(this.x,this.y,this.width,this.height);
}

protected boolean isOver(int mx, int my){
  if(mx > this.x - width/2 && mx < this.x + width/2 && my > this.y - height/2 && my < this.y + height/2)return true;
  else return false;
}

 public void isButtonClicked(){
  if (isOver(mouseX,mouseY)) println("clicked on button");
}

}
class PhotoCapture{
  private PImage image;
  ArrayList <UserDefinedObject> definedObjects;
//constructors
  PhotoCapture(){
    image = null;
    definedObjects = new ArrayList<UserDefinedObject>();
  }
  PhotoCapture(PImage p){
    this.image = p;
    definedObjects = new ArrayList<UserDefinedObject>();
  }
//getters and setters
  public PImage getImage(){
    return this.image;
  }
  public void setImage(PImage p){
    this.image = p;
  }

  public void cleanImage(){
    for (int i = 0; i < definedObjects.size(); i++){
      definedObjects.clear();
    }
  }
  public void draw(){
    image(this.image,0,0);
    for (UserDefinedObject o : definedObjects){
      o.draw();
    }
  }

}
class Relationship{
//members
  String preposition;
  UserDefinedObject object;
//constructors
  Relationship(){
    preposition = null;
    object = null;
  }
  Relationship(String a){
    if(a != " on top of " || a != " below " || a != " beside ") preposition = null;
    else preposition = a;
    object = null;
  }
  Relationship(String a, UserDefinedObject udo){
    if(a != " on top of " || a != " below " || a != " beside ") preposition = null;
    else preposition = a;
    object = udo;
  }
//getters and setters
  public String getPreposition(){
    return this.preposition;
  }
  public void setPreposition(String s){
    this.preposition = s;
  }
  public UserDefinedObject getObject(){
    return this.object;
  }
  public void setObject(UserDefinedObject o){
    this.object = o;
  }
}
// abstract class Scene{
// private int a;
//
// protected void loadPage(){
//
// }
//
// protected void draw(){
//
// }
//
// }
class UserDefinedObject{
//members
  private String title;
  private PShape objectShape;
  ArrayList<Relationship> relationships;
  ArrayList<PVector> points;
//constructors
  UserDefinedObject(){
    this.title = null;
    this.relationships = new ArrayList<Relationship>();
    this.points = new ArrayList<PVector>();
    this.objectShape = createShape();
  }

  UserDefinedObject(String title){
    this.title = title;
    this.relationships = new ArrayList<Relationship>();
    this.points = new ArrayList<PVector>();
    this.objectShape = createShape();
  }
//getters and setters
  public String getTitle(){
    return this.title;
  }
  public void setTitle(String title){
    this.title = title;
  }

  // void display() {
  //   pushMatrix();
  //   translate(0, 0);
  //   shape(this.objectShape);
  //   popMatrix();
  // }

  public void setShape(){
      fill(255,0,0,55);
      this.objectShape = createShape();
      this.objectShape.beginShape();
      for (int i = 0; i < points.size(); i++){
          PVector p = points.get(i);
          //this.objectShape.setVertex(i,p.x,p.y);
          this.objectShape.vertex(p.x,p.y);
      }
      this.objectShape.endShape();
      println("shape set");
  }

  public void draw(){
      //display();
      //background(0);

       shape(this.objectShape);

      for (int i = 0; i < points.size(); i++){
        PVector p = points.get(i);
        PVector p2 = points.get(i);
        if(i != points.size() -1) p2 = points.get(i+1); //for line to not go to last index
        noFill();
        ellipse(p.x,p.y,20,20);
        line(p.x,p.y,p2.x,p2.y);
      }
      if(points.size() > 1){ //finishing line
          line(points.get(points.size()-1).x,points.get(points.size()-1).y,points.get(0).x,points.get(0).y);
      }
  }

}
  public void settings() {  size(400,700);  pixelDensity(displayDensity()); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
