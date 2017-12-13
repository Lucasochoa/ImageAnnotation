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
  void setup(){
    //app.addObserver(this);
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
        //println("inside!!! from index: " + i );
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

  public void controlEvent(ControlEvent theEvent) {
    println((int)theEvent.getValue());
    int temp = ((int)theEvent.getValue());

    String rTemp;
    switch(temp){
      case 0: rTemp = "on top of";
      break;
      case 1: rTemp = "below";
      break;
      case 2: rTemp = "above";
      break;
      case 3: rTemp = "next to";
      break;
      case 4: rTemp = "behind";
      break;
      default: rTemp = "error";
      break;
    }
    //app.setRelationship(new Relationship(rTemp));
    p5Controllers.remove("select relationship");
  }

  void conjureDropDown(){
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
    p5Controllers.addListener(this);
  }

}
//
