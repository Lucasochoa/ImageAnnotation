AppDelegate app;

void setup(){
  pixelDensity(displayDensity());
  size(400,700);

  app = new AppDelegate();
  app.setup();
}

void draw(){
  app.draw();
}

void keyPressed() {
  if (key == 'n'){
    println("new user defined object incoming");
  }
  if (key == CODED){
    if(keyCode == RIGHT) println("right button");
    if (keyCode == LEFT) println("left button");
  }
}

void mousePressed() {
  app.clicked();
}
