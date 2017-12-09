AppDelegate app;
SelectionPage selectPage;

void setup(){
  pixelDensity(displayDensity());
  size(400,700);

  // selectPage = new SelectionPage();
  // selectPage.setup();

  app = new AppDelegate();
  app.setup();

}

void draw(){
  //selectPage.draw();
  app.draw();
}

void keyPressed() {
  if (key == 'n'){
    println("new user defined object incoming");
    //tempLoadObj();
  }
  if (key == CODED){
    if(keyCode == RIGHT) println("right button");
    if (keyCode == LEFT) println("left button");
  }
}

void mousePressed() {
  app.clicked();
  selectPage.clicked();

  //tempbuttonhandeler
  //app.checkButtons();
}
