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
    p5Controllers.addListener(this);

  }
//getters and setters
  PImage getImage(){
    return this.image;
  }
  void setImage(PImage p){
    this.image = p;
  }
  void keyPressed(){
    if(key == 'l') conjureInputField();
    if(key == 'y') drawable = true;
    else drawable = false;
  }
  void clicked(){

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

  void cleanImage(){
    definedObjects =  new ArrayList<UserDefinedObject>();
  }


  public void draw(){
    image(this.image,0,0);
    for (UserDefinedObject o : definedObjects){
      o.draw();
    }
  }

  void controlEvent(ControlEvent theEvent) {
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
      
      UserDefinedObject tempUDO1 = this.selectedObjects.get(this.selectedObjects.size()-2);
      UserDefinedObject tempUDO2 = this.selectedObjects.get(this.selectedObjects.size()-1);

      tempUDO1.relationships.add(new Relationship(tempRelationship,tempUDO2));



      println("tempRelationship: " + tempRelationship + " object 1: " + this.selectedObjects.get(this.selectedObjects.size()-1) +
      "object 2: " + this.selectedObjects.get(this.selectedObjects.size()-2)
      );
      println(tempUDO1.relationships.get(tempUDO1.relationships.size()-1).getPreposition());
      println(tempUDO1.relationships.get(tempUDO1.relationships.size()-1).getObject());
      println(tempUDO1.relationships.get(tempUDO1.relationships.size()-1).getPrintout());
      //println(this.selectedObjects.get(this.selectedObjects.size()-1).relationships.get(tempUDO1.relationships.size()-1).getPreposition());
      //println(this.selectedObjects.get(this.selectedObjects.size()-1).relationships.get(tempUDO1.relationships.size()-1).getObject());


      p5Controllers.remove("select relationship");
    }
  }

  void conjureInputField(){
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

  }

}
//
