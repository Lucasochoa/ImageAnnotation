AppDelegate app;
SelectionPage selectPage;

void setup(){
  pixelDensity(displayDensity());
  size(400,700);
  selectPage = new SelectionPage();
  selectPage.setup();
  appDelegateSetup();
}

void draw(){
  selectPage.draw();
}

void appDelegateSetup(){
  app = new AppDelegate();
  app.addButton(50,50,50,50);
  app.addButton(50,50,110,50);
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

  selectPage.clicked();
  //tempbuttonhandeler
  app.checkButtons();
  
}
