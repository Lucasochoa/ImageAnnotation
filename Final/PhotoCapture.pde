class PhotoCapture{
  private image PImage;
  definedObjects ArrayList <UserDefinedObject>;
//constructors
  PhotoCapture(){
    image = null;
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
    for (int i = 0; i < definedObjects.size(), i++){
      definedObjects[i] = null;
    }
  }

}
