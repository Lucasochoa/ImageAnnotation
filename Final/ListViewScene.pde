class ListViewScene extends Scene{
private ArrayList<PhotoCapture> captures;

  ListViewScene(ArrayList<PhotoCapture> photoCaptures){
      // this.captues = new ArrayList<PhotoCapture>();
      this.captures = photoCaptures;
  }
  void provideInfo(){
    println(this.captures);
  }

  void setup(){
    println("setting up from listView Scene");
  }
  void draw(){
    PhotoCapture selectedCapture = captures.get(captures.size()-1);
    int padding = 20;
    background(51);
    fill(10,100,100);//fill for tableview cells
    rectMode(CORNER);
    for (int i = 0; i < selectedCapture.definedObjects.size(); i++){
        rect(padding,((height-40)/selectedCapture.definedObjects.size()*i) + (padding * i),
        width-padding*2,(height-40)/selectedCapture.definedObjects.size(),20);
    }
  }
  void keyPressed(){
    println("keypressed handeler");
  }
  void clicked(){
    println("clicked handeler");
  }
}
