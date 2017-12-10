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

  }
  void keyPressed(){
    if (key == 'n'){
      captures.get(captures.size()-1).definedObjects.add(new UserDefinedObject("henry"));
      println("new object added to shown capture");
    }
    if (key == CODED){
      if(keyCode == RIGHT) captures.add(captures.remove(0));
      if (keyCode == LEFT) captures.add(0,captures.remove(captures.size()-1));
    }
  }

  void clicked(){
    captures.get(captures.size()-1).clicked();
  }

  void draw(){
    captures.get(captures.size()-1).draw();
  }
}
