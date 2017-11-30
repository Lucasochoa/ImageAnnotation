AppDelegate app;
PhotoCapture photoCapture1;
UserDefinedObject tempObj;
PImage photo1;
PImage photo2;
PImage photo3;

int w,h;

void setup(){
  size(400,700);
  tempLoadImage();
  tempLoadObj();

  //app = new AppDelegate()
}
void draw(){
  photoCapture1.draw();
}

void tempLoadObj(){
  tempObj = new UserDefinedObject("henry");
  photoCapture1.definedObjects.add(tempObj);
}

void tempLoadImage(){
  photo1 = loadImage("images/photo1.png");
  photo1.resize(400,700);
  photoCapture1 = new PhotoCapture();
  photoCapture1.setImage(photo1);
}

void keyPressed() {
  if (key == 'n'){
    println("apple");
    tempLoadObj();
  }
}

void mousePressed() {
  photoCapture1.definedObjects.get(photoCapture1.definedObjects.size()-1).points.add(new PVector(mouseX,mouseY));
  println(tempObj.points);
  //game.mouseDragged(mouseX, mouseY);
}
