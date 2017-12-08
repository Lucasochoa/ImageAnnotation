AppDelegate app;
PhotoCapture photoCapture1;
UserDefinedObject tempObj;
PImage photo1;
PImage photo2;
PImage photo3;

int w,h;

void setup(){
  pixelDensity(displayDensity());
  size(400,700);
  appDelegateSetup();
  tempLoadImage();
  tempLoadObj();

  //app = new AppDelegate()
}
void draw(){
  photoCapture1.draw();
  //app.draw();
}
void appDelegateSetup(){
  app = new AppDelegate();
  app.addButton(50,50,50,50);
  app.addButton(50,50,110,50);
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
    println("new user defined object incoming");
    tempLoadObj();
  }
  if (key == CODED){
    if(keyCode == RIGHT) println("right button");
    if (keyCode == LEFT) println("left button");
  }
}

void mousePressed() {
  photoCapture1.definedObjects.get(photoCapture1.definedObjects.size()-1).points.add(new PVector(mouseX,mouseY));
  photoCapture1.definedObjects.get(photoCapture1.definedObjects.size()-1).setShape();
  println(tempObj.points);

  //tempbuttonhandeler
  app.checkButtons();




  //game.mouseDragged(mouseX, mouseY);
}
