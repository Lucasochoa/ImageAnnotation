import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Final extends PApplet {




//ControlP5 cp5;
//String textValue = "";
AppDelegate app;
PApplet publicApplet = this;

public void setup(){
  //pixelDensity(displayDensity());
  

  app = new AppDelegate();
  app.setup();


  // cp5 = new ControlP5(this);
  // cp5.addTextfield("Input Object Name")
  //  .setPosition(20,height-40)
  //  .setAutoClear(true)
  //  ;


}

public void draw(){
  app.draw();
}

public void keyPressed() {
  if(key == 't'){
    //println(app.getRelationshipString());
  }
  app.keyPressed();
}

public void mousePressed() {
  app.clicked();
}

// void controlEvent(ControlEvent theEvent) {
//   if(theEvent.isAssignableFrom(Textfield.class)) {
//     println("controlEvent: accessing a string from controller '"
//             +theEvent.getName()+"': "
//             +theEvent.getStringValue()
//             );
//     println("meow mix meow mix");
//   }
//}




// public void conjureDropDown(){
//
//   List l = Arrays.asList("on top of", "below", "above", "next to", "behind","inside of");
//   /* add a ScrollableList, by default it behaves like a DropdownList */
//   cp5.addScrollableList("select relationship")
//      .setPosition(width-200, 0)
//      .setSize(200, 100)
//      .setBarHeight(20)
//      .setItemHeight(20)
//      .addItems(l)
//      .close()
//      // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
//      ;
// }


// void controlEvent(ControlEvent theEvent) {
//   //println(theEvent);
//   //println(theEvent.getLabel());
//   println((int)theEvent.getValue());
//   int temp = ((int)theEvent.getValue());
//   // if (theEvent.isGroup()) {
//   //   println(theEvent.getGroup() + " => " + theEvent.getGroup().getValue());
//
//   String rTemp;
//   switch(temp){
//     case 0: rTemp = "on top of";
//     break;
//     case 1: rTemp = "below";
//     break;
//     case 2: rTemp = "above";
//     break;
//     case 3: rTemp = "next to";
//     break;
//     case 4: rTemp = "behind";
//     break;
//     default: rTemp = "error";
//     break;
//   }
//   app.setRelationship(new Relationship(rTemp));
//   cp5.remove("select relationship");
// }




// void dropdown(int n) {
//   /* request the selected item based on index n */
//   println(n, cp5.get(ScrollableList.class, "dropdown").getItem(n));
//
//   /* here an item is stored as a Map  with the following key-value pairs:
//    * name, the given name of the item
//    * text, the given text of the item by default the same as name
//    * value, the given value of the item, can be changed by using .getItem(n).put("value", "abc"); a value here is of type Object therefore can be anything
//    * color, the given color of the item, how to change, see below
//    * view, a customizable view, is of type CDrawable
//    */
//
//    CColor c = new CColor();
//   c.setBackground(color(255,0,0));
//   cp5.get(ScrollableList.class, "dropdown").getItem(n).put("color", c);
//   cp5.get(ScrollableList.class, "dropdown").setType(ControlP5.DROPDOWN);
// }
class AppDelegate extends Observable{
  //private Relationship globalRelationship;
  private ArrayList<Button> buttons;
  private ArrayList<Scene> scenes;
  private Scene currentScene;
  private ListViewScene listScene;
  //int width, height;
//contstructor
  AppDelegate(){
    super();
    //globalRelationship = null;
    scenes = new ArrayList<Scene>();
    buttons = new ArrayList<Button>();
    currentScene = null;
    // this.width = 400;
    // this.height = 600;
  }
  // String getRelationshipString(){
  //   return this.globalRelationship.getPreposition();
  // }
  // void setRelationship(Relationship r){
  //   this.globalRelationship = r;
  //   setChanged();
  //   notifyObservers();
  // }

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
            Scene tempScene = scenes.get(scenes.size()-1);

            if(tempScene instanceof ListViewScene){
              tempScene.show();
            }
            else{
              this.listScene.hideController();
            }

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

    this.listScene = new ListViewScene(selectPage.getPhotoCaptures()); //temp
    this.listScene.setup();

    scenes.add(this.listScene);
    scenes.add(selectPage);


    //control setup
    //this.addButton(50,50,50,50,"left");
    this.addButton(50,30,width-70,height-40,"right");
  }

  public void draw(){
    // for (Scene s: scenes){
    //   s.draw();
    // }
    scenes.get(scenes.size()-1).draw();


  //ui bar

  fill(0);
  rectMode(CORNER);
  rect(0,height-50,width,50);

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
  fill(color(255));
  rectMode(CORNER);
  rect(this.x,this.y,this.width,this.height);
  fill(0);
  textSize(12);
  text("mode",337,680);
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
class ListViewScene extends Scene implements ControlListener{
private ArrayList<PhotoCapture> captures;
private ControlP5 p5Controllers;
UserDefinedObject selectedUDO;

  ListViewScene(ArrayList<PhotoCapture> photoCaptures){
      this.p5Controllers = new ControlP5(publicApplet);
      this.captures = photoCaptures;
      this.selectedUDO = null;
  }
  public void provideInfo(){
    println(this.captures);
  }

  public void setup(){
    this.p5Controllers.addListener(this);
    conjureList();
    conjureRelationshipList();



    //customize(d1);
    //d1.hide();
    //println("working from list view scene");
  }


  public void draw(){
    background(51);
    if(this.selectedUDO != null){
      fill(50, 239, 201); //blue
      rectMode(CORNER);
      rect(0,20,width,30,10);
      fill(0);
      textSize(15);
      text(this.selectedUDO.getTitle(),20,40);
      //rectMode(CORNER);

      // int padding = 50;
      // for(int i = 0; i < this.selectedUDO.relationships.size();i++){
      //   rect(160,(i*40)+padding,100,30,10);
      // }



    }

    // PhotoCapture selectedCapture = captures.get(captures.size()-1);
    // int padding = 20;
    //
    // textSize(30);
    // background(51);
    //
    // rectMode(CORNER);
    //
    // for (int i = 0; i < selectedCapture.definedObjects.size(); i++){
    //     fill(10,100,100);//fill for tableview cells
    //     rect(padding,((height-40)/selectedCapture.definedObjects.size()*i) + (padding * i),
    //     width-padding*2,(height-40)/selectedCapture.definedObjects.size(),20);
    //     fill(255);
    //     text(selectedCapture.definedObjects.get(i).getTitle(),padding * 2, ((height/selectedCapture.definedObjects.size())*i)+padding * 2);
    //     // try{
    //     //     text(selectedCapture.definedObjects.get(i).relationships.get(0).getPreposition(),padding * 2, ((height/selectedCapture.definedObjects.size())*i)+padding * 2);
    //     // }
    //     // catch(IndexOutOfBoundsException e){
    //     //   println("error");
    //     // }
    //
    // }
  }
  public void keyPressed(){
    if (key == 'e') println("working from list view");
  }
  public void clicked(){
    //println("clicked handeler");
  }
  public void hideController(){
    println("hiding controller");
    this.p5Controllers.getController("list of labeled objects").hide();
    this.p5Controllers.remove("list of labeled objects");
    this.p5Controllers.getController("list of rleationships").hide();
    this.p5Controllers.remove("list of rleationships");
    //this.p5Controllers.getController("list of rleationships").show();
  }
  public void show(){
    println("showing controller");
    conjureList();
    conjureRelationshipList();
    this.p5Controllers.getController("list of rleationships").show();
    this.p5Controllers.getController("list of labeled objects").show();
  }
  public void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.

  // if (theEvent.isGroup()) {
  //   // check if the Event was triggered from a ControlGroup
  //   println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  // }
  if (theEvent.isController()) {
    int temp = ((int)theEvent.getValue());
    //rintln(temp);
    PhotoCapture selectedCapture = captures.get(captures.size()-1);
    this.selectedUDO = selectedCapture.definedObjects.get(temp);
    println(this.selectedUDO.relationships.size());
    conjureRelationshipList();
    this.p5Controllers.getController("list of rleationships").show();
    //println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}
  public void conjureRelationshipList(){
    DropdownList d2 = this.p5Controllers.addDropdownList("list of rleationships")
          .setPosition(0,300)
          .setSize(width,height-100)
          ;
    if(this.selectedUDO!= null){
      if (!this.selectedUDO.relationships.isEmpty()){
          for (int i = 0; i < this.selectedUDO.relationships.size(); i++){
            d2.addItem(this.selectedUDO.relationships.get(i).getPrintout(),i);
          }
      }
    }
    customize(d2,"objet relationships");
    d2.hide();
  }

  public void conjureList(){

    DropdownList d1 = this.p5Controllers.addDropdownList("list of labeled objects")
          .setPosition(0,0)
          .setSize(width,height)
          //.addItems(l)
          ;
    PhotoCapture selectedCapture = captures.get(captures.size()-1);
    for (int i=0; i<selectedCapture.definedObjects.size(); i++) {
        d1.addItem(selectedCapture.definedObjects.get(i).getTitle() +" index "+ i, i);
    }
    customize(d1, "list of labeled objects");
    d1.hide();
  }


  public void customize(DropdownList ddl,String s) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.getCaptionLabel().set(s);
  // for (int i=0;i<20;i++) {
  //   ddl.addItem("item "+i, i);
  // }
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
  }
}
class PhotoCapture implements ControlListener{
  private ControlP5 p5Controllers;
  private boolean drawable;
  private String name;
  private PImage image;
  private ArrayList<UserDefinedObject> selectedObjects;
  ArrayList <UserDefinedObject> definedObjects;

//constructors
  PhotoCapture(){
    //PApplet app
    this.p5Controllers = new ControlP5(publicApplet);
    //super();
    this.drawable = false;
    this.image = null;
    this.name = "empty name";
    this.definedObjects = new ArrayList<UserDefinedObject>();
    this.selectedObjects = new ArrayList<UserDefinedObject>();
  }
  PhotoCapture(PImage p){
    //super();
    this.p5Controllers = new ControlP5(publicApplet);
    this.drawable = false;
    this.image = p;
    this.name = "empty name";
    this.selectedObjects = new ArrayList<UserDefinedObject>();
    definedObjects = new ArrayList<UserDefinedObject>();
    definedObjects.add(new UserDefinedObject("temp"));
  }
  public void setup(){
    p5Controllers.addListener(this);

  }
//getters and setters
  public PImage getImage(){
    return this.image;
  }
  public void setImage(PImage p){
    this.image = p;
  }
  public void keyPressed(){
    if(key == 'l') conjureInputField();
    if(key == 'y') drawable = true;
    else drawable = false;
  }
  public void clicked(){

    for (int i = 0; i< definedObjects.size(); i++){

      if (isInsidePolygon(definedObjects.get(i).points,mouseX,mouseY)){
        //println("inside!!! from index: " + i );
        //println(definedObjects.get(i).getTitle());
        boolean tempIsDuplicate = false;
        //println("photocapture printout " + this.selectedObjects);
        if (!this.selectedObjects.isEmpty()){
          for (UserDefinedObject u: this.selectedObjects){
            if (definedObjects.get(i) == u){
               tempIsDuplicate = true;
               println("duplicate!");
            }
          }
          if(!tempIsDuplicate) this.selectedObjects.add(definedObjects.get(i));
        }
        else this.selectedObjects.add(definedObjects.get(i));
        if (this.selectedObjects.size()  >=  2){
            //println()
            conjureDropDown();
        }
        //println(this.selectedObjects)
      }
    }


    if(drawable){
      definedObjects.get(definedObjects.size()-1).points.add(new PVector(mouseX,mouseY));
      definedObjects.get(definedObjects.size()-1).setShape();
    }
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

  public void controlEvent(ControlEvent theEvent) {
    //println((int)theEvent.getValue());
    if(theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
    if(!this.selectedObjects.isEmpty()){
        this.selectedObjects.get(this.selectedObjects.size()-1).setTitle(theEvent.getStringValue());
    }

    p5Controllers.remove("Input Object Name");
    }
    //************* code for list view *************
    else{
      int temp = ((int)theEvent.getValue());

      String tempRelationship;
      switch(temp){
        case 0: tempRelationship = "on top of";
        break;
        case 1: tempRelationship = "below";
        break;
        case 2: tempRelationship = "above";
        break;
        case 3: tempRelationship = "next to";
        break;
        case 4: tempRelationship = "behind";
        break;
        case 5: tempRelationship = "inside of";
        break;
        default: tempRelationship = "error";
        break;
      }
      println("tempRelationship: " + tempRelationship + " object 1: " + this.selectedObjects.get(this.selectedObjects.size()-1) +
      "object 2: " + this.selectedObjects.get(this.selectedObjects.size()-2)
      );

      UserDefinedObject tempUDO1 = this.selectedObjects.get(this.selectedObjects.size()-2);
      UserDefinedObject tempUDO2 = this.selectedObjects.get(this.selectedObjects.size()-1);

      tempUDO1.relationships.add(new Relationship(tempRelationship,tempUDO2));

      println(tempUDO1.relationships.get(tempUDO1.relationships.size()-1).getPreposition());
      println(tempUDO1.relationships.get(tempUDO1.relationships.size()-1).getObject());
      println(tempUDO1.relationships.get(tempUDO1.relationships.size()-1).getPrintout());
      //println(this.selectedObjects.get(this.selectedObjects.size()-1).relationships.get(tempUDO1.relationships.size()-1).getPreposition());
      //println(this.selectedObjects.get(this.selectedObjects.size()-1).relationships.get(tempUDO1.relationships.size()-1).getObject());


      p5Controllers.remove("select relationship");
    }
  }

  public void conjureInputField(){
    p5Controllers.addTextfield("Input Object Name")
     .setCaptionLabel("set name for object")
     .setPosition(20,height-40)
     .setSize(200,20)
     .setAutoClear(true)
     ;
    if (!this.selectedObjects.isEmpty()){
        p5Controllers.getController("Input Object Name")
        .setCaptionLabel("set name for object number: " + this.definedObjects.size());
    }
    //if(p5Controllers.getController("Input Object Name"))

  }
  public void conjureDropDown(){
    List l = Arrays.asList("on top of", "below", "above", "next to", "behind","inside of");
    /* add a ScrollableList, by default it behaves like a DropdownList */
    p5Controllers.addScrollableList("select relationship")
       .setPosition(width-200, 0)
       .setSize(200, 100)
       .setBarHeight(20)
       .setItemHeight(20)
       .addItems(l)
       .close()
       // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
       ;

  }

}
//
class Relationship{
//members
  private String preposition;
  private UserDefinedObject object;
//constructors
  Relationship(){
    this.preposition = null;
    this.object = null;
  }
  Relationship(String a){
    // if(a != " on top of " || a != " below " || a != " beside ") preposition = null;
    // else preposition = a;
    this.preposition = a;
    object = null;
  }
  Relationship(String a, UserDefinedObject udo){
    // if(a != " on top of " || a != " below " || a != " beside ") preposition = null;
    // else preposition = a;
    this.preposition = a;
    this.object = udo;
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
  public String getPrintout(){
    return "this object is " + this.preposition + " " + this.object.getTitle();
  }
}
abstract class Scene{
private String name;
private int index;

  public abstract void setup();
  public abstract void draw();
  public abstract void keyPressed();
  public abstract void clicked();
  public abstract void show();
  public abstract void hideController();

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

    //for (PhotoCapture c: captures){
    captures.get(captures.size()-1).setup();
    //}

  }
  public void keyPressed(){
    if (key == 'n'){
      //temp
      ArrayList<Relationship> relationships = new ArrayList<Relationship>();
      UserDefinedObject tempObject = new UserDefinedObject("temporary object");
      relationships.add(new Relationship(" on top of ", tempObject));
      //temp
      captures.get(captures.size()-1).definedObjects.add(new UserDefinedObject("new unlabeled object"));
      println("new object added to shown capture");
    }
    if (key == CODED){
      if(keyCode == RIGHT) captures.add(captures.remove(0));
      if (keyCode == LEFT) captures.add(0,captures.remove(captures.size()-1));
    }

    captures.get(captures.size()-1).keyPressed();

  }

  public void clicked(){
    //this.currentCapture = captures.get(captures.size()-1);

    // for (int i = 0; i< this.currentCapture.definedObjects.size(); i++){
    //   if (isInsidePolygon(this.currentCapture.definedObjects.get(i).points,mouseX,mouseY)){
    //     println("inside!!! from index: " + i );
    //     //this.selectedObject = definedObjects.get(i);
    //     conjureDropDown();
    //   }
    // }


    captures.get(captures.size()-1).clicked();
  }

  public void draw(){
    captures.get(captures.size()-1).draw();
  }
  public void show(){
    //do something
  }
  public void hideController(){
    //doSomething
  }
}

//not my code!! https://forum.processing.org/two/discussion/6094/ability-to-select-custom-shapes-created-using-vertex
public boolean isInsidePolygon(ArrayList<PVector> verts, float x0, float y0){
  boolean oddNodes = false;
  for (int i = 0, j = verts.size() - 1; i < verts.size(); j = i, i++) {
    PVector vi = verts.get(i);
    PVector vj = verts.get(j);
    if ((vi.y < y0 && vj.y >= y0 || vj.y < y0 && vi.y >= y0) &&
    (vi.x + (y0 - vi.y) / (vj.y - vi.y) * (vj.x - vi.x) < x0))
      oddNodes = !oddNodes;
  }
  return oddNodes;
}
class UserDefinedObject{
//members
  private String title;
  private PShape objectShape;
  ArrayList<Relationship> relationships;
  ArrayList<PVector> points;
//constructors
  UserDefinedObject(){
    this.title = "empty name";
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
  UserDefinedObject(String title, ArrayList<Relationship> relationships){
    this.title = title;
    this.relationships = relationships;
    this.points = new ArrayList<PVector>();
    this.objectShape = createShape();
  }
//getters and setters
  public String getTitle(){
    return this.title;
  }
  // void addRelationship(Relationship r){
  //   this.relationships.add(r);
  // }
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
      //println("shape set");
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
  public void settings() {  size(400,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
