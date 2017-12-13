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
  }

  void draw(){
    PhotoCapture selectedCapture = captures.get(captures.size()-1);
    int padding = 20;

    textSize(30);
    background(51);

    rectMode(CORNER);

    for (int i = 0; i < selectedCapture.definedObjects.size(); i++){
        fill(10,100,100);//fill for tableview cells
        rect(padding,((height-40)/selectedCapture.definedObjects.size()*i) + (padding * i),
        width-padding*2,(height-40)/selectedCapture.definedObjects.size(),20);
        fill(255);
        text(selectedCapture.definedObjects.get(i).getTitle(),padding * 2, ((height/selectedCapture.definedObjects.size())*i)+padding * 2);
        // try{
        //     text(selectedCapture.definedObjects.get(i).relationships.get(0).getPreposition(),padding * 2, ((height/selectedCapture.definedObjects.size())*i)+padding * 2);
        // }
        // catch(IndexOutOfBoundsException e){
        //   println("error");
        // }

    }
  }
  void keyPressed(){
    if (key == 'e') println("working from list view");
  }
  void clicked(){
    //println("clicked handeler");
  }
}
