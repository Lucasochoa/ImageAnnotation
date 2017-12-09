class SelectionPage extends Scene{
ArrayList<PhotoCapture> captures;

  SelectionPage(){
    this.captures = new ArrayList<PhotoCapture>();
    //self.setup();
  }

  void setup(){
    //super.setup();
    captures = new ArrayList<PhotoCapture>();
    PImage photo1 = loadImage("images/photo1.png");
    photo1.resize(400,700);
    captures.add(new PhotoCapture(photo1));
  }
  void clicked(){
    captures.get(captures.size()-1).clicked();
  }

  void draw(){
    captures.get(captures.size()-1).draw();
  }
}
