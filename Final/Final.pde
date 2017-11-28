AppDelegate app;
PhotoCapture photoCapture1;
PImage photo1;
PImage photo2;
PImage photo3;

void setup(){
  photo1 = loadImage("images/photo1.png");
  photoCapture1 = new PhotoCapture();
  photoCapture1.setImage(photo1);


  //app = new AppDelegate();
  size(300,400);

}
void draw(){
  photoCapture1.draw();
}
