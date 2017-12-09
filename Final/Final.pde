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
  app.keyPressed();
}

void mousePressed() {
  app.clicked();
}
