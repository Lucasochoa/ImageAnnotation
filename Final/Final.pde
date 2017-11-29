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
  photoCapture1.definedObjects.add(tempObj);
  //app = new AppDelegate()
}
void draw(){
  photoCapture1.draw();
}

void tempLoadObj(){
  tempObj = new UserDefinedObject("henry");
}

void tempLoadImage(){
  photo1 = loadImage("images/photo1.png");
  photo1.resize(400,700);
  photoCapture1 = new PhotoCapture();
  photoCapture1.setImage(photo1);
}

void mouseClicked() {
  tempObj.points.add(new PVector(mouseX,mouseY));
  println(tempObj.points);
  //game.mouseDragged(mouseX, mouseY);
}
