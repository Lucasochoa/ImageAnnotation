class SelectionPage extends Scene{
private ArrayList<PhotoCapture> captures;
private PhotoCapture currentCapture;

  SelectionPage(){
    this.captures = new ArrayList<PhotoCapture>();
    currentCapture = null;
  }
  //getters and setters
  ArrayList<PhotoCapture> getPhotoCaptures(){
    return this.captures;
  }

  void setup(){

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
  void keyPressed(){
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
  void addNewObject(){
    ArrayList<Relationship> relationships = new ArrayList<Relationship>();
    UserDefinedObject tempObject = new UserDefinedObject("temporary object");
    relationships.add(new Relationship(" on top of ", tempObject));
    //temp
    captures.get(captures.size()-1).definedObjects.add(new UserDefinedObject("new unlabeled object"));
    println("new object added to shown capture");
  }

  void clicked(){
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

  void draw(){
    captures.get(captures.size()-1).draw();
  }
  void show(){
    //do something
  }
  void hideController(){
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
