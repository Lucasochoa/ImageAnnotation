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
PImage photo1;
PImage photo2;
PImage photo3;

public void setup(){
  photo1 = loadImage("images/photo1.png");
  photoCapture1 = new PhotoCapture();
  photoCapture1.setImage(photo1);


  //app = new AppDelegate();
  

}
public void draw(){
  photoCapture1.draw();
}
class AppDelegate{
  private ArrayList<PhotoCapture> annotatedCaptures;
  int width, height;
//contstructor
  AppDelegate(){
    annotatedCaptures = new ArrayList<PhotoCapture>();
    this.width = 400;
    this.height = 600;
  }
//getters and setters
  public void addPhotoCapture(PhotoCapture p){
    this.annotatedCaptures.add(p);
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
      //definedObjects[i] = null;
    }
  }
  public void draw(){
    image(this.image,0,0);
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
class UserDefinedObject{
//members
  private String title;
  ArrayList<Relationship> relationships;
  ArrayList<PVector> points;
//constructors
  UserDefinedObject(){
    this.title = null;
    relationships = new ArrayList<Relationship>();
    points = new ArrayList<PVector>();
  }

  UserDefinedObject(String title){
    this.title = title;
    relationships = new ArrayList<Relationship>();
    points = new ArrayList<PVector>();
  }
//getters and setters
  public String getTitle(){
    return this.title;
  }
  public void setTitle(String title){
    this.title = title;
  }
  // void addRelationship(Relationship r){
  //   relationships.add(r);
  // }
  // void addPoint(PVector p){
  //   points.add(p);
  //}

}
  public void settings() {  size(300,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
