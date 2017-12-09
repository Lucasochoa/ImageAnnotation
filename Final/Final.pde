AppDelegate app;
PhotoCapture photoCapture1;
UserDefinedObject tempObj;
SelectionPage selectPage;

PImage photo1;
PImage photo2;
PImage photo3;

int w,h;

void setup(){
  pixelDensity(displayDensity());
  size(400,700);
  selectPage = new SelectionPage();
  selectPage.setup();

  appDelegateSetup();
  //tempLoadImage();

  //app = new AppDelegate()
}
void draw(){
  selectPage.draw();
  //photoCapture1.draw();
}
void appDelegateSetup(){
  app = new AppDelegate();
  app.addButton(50,50,50,50);
  app.addButton(50,50,110,50);
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
    //tempLoadObj();
  }
  //if (key == 'c')photoCapture1.cleanImage();
  if (key == CODED){
    if(keyCode == RIGHT) println("right button");
    if (keyCode == LEFT) println("left button");
  }
}

void mousePressed() {

  selectPage.clicked();
  // photoCapture1.definedObjects.get(photoCapture1.definedObjects.size()-1).points.add(new PVector(mouseX,mouseY));
  // photoCapture1.definedObjects.get(photoCapture1.definedObjects.size()-1).setShape();

  //println(tempObj.points);

  //tempbuttonhandeler
  app.checkButtons();




  //game.mouseDragged(mouseX, mouseY);
}
