class AppDelegate{
  private ArrayList<PhotoCapture> annotatedCaptures;
  private ArrayList<Button> buttons;
  private ArrayList<Scene> scenes;
  int width, height;
//contstructor
  AppDelegate(){
    annotatedCaptures = new ArrayList<PhotoCapture>();
    scenes = new ArrayList<Scene>();
    buttons = new ArrayList<Button>();
    this.width = 400;
    this.height = 600;
  }
//getters and setters
  void addPhotoCapture(PhotoCapture p){
    this.annotatedCaptures.add(p);
  }
  void addButton(int width,int height,int x,int y){
    this.buttons.add(new Button(width,height,x,y));
  }
//loop checkers
  void checkButtons(){
    for (Button b: buttons){
      b.isButtonClicked();
    }
  }


  void draw(){
    for (Button b: buttons){
      b.draw();
    }
  }

}
