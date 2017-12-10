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

public void setup(){
  
  

  app = new AppDelegate();
  app.setup();
}

public void draw(){
  app.draw();
}

public void keyPressed() {
  app.keyPressed();
}

public void mousePressed() {
  app.clicked();
}
class AppDelegate{
  private ArrayList<Button> buttons;
  private ArrayList<Scene> scenes;
  private Scene currentScene;
  int width, height;
//contstructor
  AppDelegate(){
    scenes = new ArrayList<Scene>();
    buttons = new ArrayList<Button>();
    currentScene = null;
    this.width = 400;
    this.height = 600;
  }

   public void addButton(int width,int height,int x,int y,String s){
    this.buttons.add(new Button(width,height,x,y,s));
  }

  public void clicked(){
    boolean trigger = false;
    for (Button b: buttons){
      trigger = b.isButtonClicked();
      if (b.isButtonClicked()){
          if (b.getName() == "right"){
            scenes.add(scenes.remove(0));
            println("clicking from right");
          }
          if (b.getName() == "left") println("clicking from left");
          break;
      }
    }
    if (!trigger){
      for (Scene s: scenes){
        s.clicked();
      }
    }
  }

  public void keyPressed(){
    for (Scene s: scenes){
      s.keyPressed();
    }
    ///if (key == 'n') println("new user defined object incoming");
  }

  public void setup(){
    SelectionPage selectPage = new SelectionPage();
    selectPage.setup();

    ListViewScene listViewPage = new ListViewScene(selectPage.getPhotoCaptures()); //temp

    scenes.add(listViewPage);
    scenes.add(selectPage);


    //control setup
    this.addButton(50,50,50,50,"left");
    this.addButton(50,50,110,50,"right");
  }

  public void draw(){
    // for (Scene s: scenes){
    //   s.draw();
    // }
    scenes.get(scenes.size()-1).draw();

    for (Button b: buttons){
      b.draw();
    }
  }

}
class Button{
protected String name;
protected int width,height,x,y;
protected int col;

Button(int width,int height,int x,int y,String name){
  this.name = name;
  this.width = width;
  this.height = height;
  this.x = x;
  this.y = y;
}
//getters and setters
public String getName(){
  return this.name;
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

 public boolean isButtonClicked(){
  if (isOver(mouseX,mouseY)){
    return true;
  }
  else return false;
}

}
class ListViewScene extends Scene{
private ArrayList<PhotoCapture> captures;

  ListViewScene(ArrayList<PhotoCapture> photoCaptures){
      // this.captues = new ArrayList<PhotoCapture>();
      this.captures = photoCaptures;
  }
  public void provideInfo(){
    println(this.captures);
  }

  public void setup(){
    println("setting up from listView Scene");
  }
  public void draw(){
    PhotoCapture selectedCapture = captures.get(captures.size()-1);
    int padding = 20;
    background(51);
    fill(10,100,100);//fill for tableview cells
    rectMode(CORNER);
    for (int i = 0; i < selectedCapture.definedObjects.size(); i++){
        rect(padding,((height-40)/selectedCapture.definedObjects.size()*i) + (padding * i),
        width-padding*2,(height-40)/selectedCapture.definedObjects.size(),20);
    }
  }
  public void keyPressed(){
    println("keypressed handeler");
  }
  public void clicked(){
    println("clicked handeler");
  }
}
class PhotoCapture{
  private String name;
  private PImage image;
  ArrayList <UserDefinedObject> definedObjects;
//constructors
  PhotoCapture(){
    this.image = null;
    this.name = "empty name";
    this.definedObjects = new ArrayList<UserDefinedObject>();
  }
  PhotoCapture(PImage p){
    this.image = p;
    this.name = "empty name";
    definedObjects = new ArrayList<UserDefinedObject>();
    definedObjects.add(new UserDefinedObject("temp"));
  }
//getters and setters
  public PImage getImage(){
    return this.image;
  }
  public void setImage(PImage p){
    this.image = p;
  }
  public void clicked(){
    definedObjects.get(definedObjects.size()-1).points.add(new PVector(mouseX,mouseY));
    definedObjects.get(definedObjects.size()-1).setShape();
  }

  public void cleanImage(){
    definedObjects =  new ArrayList<UserDefinedObject>();
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
abstract class Scene{
private String name;
private int index;

  public abstract void setup();
  public abstract void draw();
  public abstract void keyPressed();
  public abstract void clicked();

}
class SelectionPage extends Scene{
private ArrayList<PhotoCapture> captures;
private PhotoCapture currentCapture;

  SelectionPage(){
    this.captures = new ArrayList<PhotoCapture>();
    currentCapture = null;
  }
  //getters and setters
  public ArrayList<PhotoCapture> getPhotoCaptures(){
    return this.captures;
  }

  public void setup(){

    captures = new ArrayList<PhotoCapture>();

    PImage photo1 = loadImage("images/photo1.png");
    PImage photo2 = loadImage("images/photo2.png");
    PImage photo3 = loadImage("images/photo3.png");

    photo1.resize(400,700);
    photo2.resize(400,700);
    photo3.resize(400,700);

    captures.add(new PhotoCapture(photo1));
    captures.add(new PhotoCapture(photo2));
    captures.add(new PhotoCapture(photo3));

  }
  public void keyPressed(){
    if (key == 'n'){
      captures.get(captures.size()-1).definedObjects.add(new UserDefinedObject("henry"));
      println("new object added to shown capture");
    }
    if (key == CODED){
      if(keyCode == RIGHT) captures.add(captures.remove(0));
      if (keyCode == LEFT) captures.add(0,captures.remove(captures.size()-1));
    }
  }

  public void clicked(){
    captures.get(captures.size()-1).clicked();
  }

  public void draw(){
    captures.get(captures.size()-1).draw();
  }
}
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
