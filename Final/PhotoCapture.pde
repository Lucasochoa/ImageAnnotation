class PhotoCapture{
  private boolean drawable;
  private String name;
  private PImage image;
  private UserDefinedObject selectedObject;
  ArrayList <UserDefinedObject> definedObjects;

//constructors
  PhotoCapture(){
    this.drawable = false;
    this.image = null;
    this.name = "empty name";
    this.definedObjects = new ArrayList<UserDefinedObject>();
  }
  PhotoCapture(PImage p){
    this.drawable = false;
    this.image = p;
    this.name = "empty name";
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
  void keyPressed(){
    if(key == 'y') drawable = true;
    else drawable = false;
  }
  void clicked(){
    for (int i = 0; i< definedObjects.size(); i++){
      if (isInsidePolygon(definedObjects.get(i).points,mouseX,mouseY)){
        println("inside!!! from index: " + i );
        this.selectedObject = definedObjects.get(i);
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
