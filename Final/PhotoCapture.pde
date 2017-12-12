class PhotoCapture implements Observer{
  //private ControlP5 controllers;
  private boolean drawable;
  private String name;
  private PImage image;
  private ArrayList<UserDefinedObject> selectedObjects;
  ArrayList <UserDefinedObject> definedObjects;

//constructors
  PhotoCapture(){
    //this.controllers = new ControlP5();
    //super();
    this.drawable = false;
    this.image = null;
    this.name = "empty name";
    this.definedObjects = new ArrayList<UserDefinedObject>();
    this.selectedObjects = new ArrayList<UserDefinedObject>();
  }
  PhotoCapture(PImage p){
    //super();
    //this.controllers = new ControlP5();
    this.drawable = false;
    this.image = p;
    this.name = "empty name";
    this.selectedObjects = new ArrayList<UserDefinedObject>();
    definedObjects = new ArrayList<UserDefinedObject>();
    definedObjects.add(new UserDefinedObject("temp"));
  }
  void setup(){
    app.addObserver(this);
    //cp5 = new ControlP5(this);
    //println("setup complete");
  }
//getters and setters
  PImage getImage(){
    return this.image;
  }
  void setImage(PImage p){
    this.image = p;
  }
  void keyPressed(){
    if(key == 'y') drawable = true;
    else drawable = false;
  }
  void clicked(){

    for (int i = 0; i< definedObjects.size(); i++){
      if (isInsidePolygon(definedObjects.get(i).points,mouseX,mouseY)){
        println("inside!!! from index: " + i );
        //captures.add(captures.remove(0));
        if(this.selectedObjects.size() < 1){
            this.selectedObjects.add(definedObjects.get(i));
        }
        // else{
        //   this.selectedObjects.remove(0);
        //   this.selectedObjects.add(definedObjects.get(i));
        // }

        println("photocapture printout " + this.selectedObjects);
        if (this.selectedObjects.size() == 1){
            conjureDropDown();
        }

      }
    }


    if(drawable){
      definedObjects.get(definedObjects.size()-1).points.add(new PVector(mouseX,mouseY));
      definedObjects.get(definedObjects.size()-1).setShape();
    }
  }

  void cleanImage(){
    definedObjects =  new ArrayList<UserDefinedObject>();
  }
  public void draw(){
    image(this.image,0,0);
    for (UserDefinedObject o : definedObjects){
      o.draw();
    }
  }
  void update(Observable obs, Object obj){
    println("updating from observer");
    println(this.selectedObjects);
    println(app.getRelationshipString());
  }

}
//
