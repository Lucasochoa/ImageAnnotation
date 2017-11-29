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
  PImage getImage(){
    return this.image;
  }
  void setImage(PImage p){
    this.image = p;
  }

  void cleanImage(){
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
