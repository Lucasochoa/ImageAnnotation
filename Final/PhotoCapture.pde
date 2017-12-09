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
    definedObjects.add(new UserDefinedObject("temp"));
  }
//getters and setters
  PImage getImage(){
    return this.image;
  }
  void setImage(PImage p){
    this.image = p;
  }
  void clicked(){
    definedObjects.get(definedObjects.size()-1).points.add(new PVector(mouseX,mouseY));
    definedObjects.get(definedObjects.size()-1).setShape();
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

}
