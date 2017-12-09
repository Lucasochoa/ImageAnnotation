class AppDelegate{
  //private ArrayList<PhotoCapture> annotatedCaptures;
  private ArrayList<Button> buttons;
  private ArrayList<Scene> scenes;
  int width, height;
//contstructor
  AppDelegate(){
    scenes = new ArrayList<Scene>();
    buttons = new ArrayList<Button>();
    this.width = 400;
    this.height = 600;
  }
//getters and setters

   void addButton(int width,int height,int x,int y){
    this.buttons.add(new Button(width,height,x,y));
  }
//loop checkers

  void clicked(){
    boolean trigger = false;
    for (Button b: buttons){
      trigger = b.isButtonClicked();
      if (b.isButtonClicked()) break;
    }
    if (!trigger){
      for (Scene s: scenes){
        s.clicked();
      }
    }

  }

  void setup(){
    SelectionPage selectPage = new SelectionPage();
    selectPage.setup();

    scenes.add(selectPage);
    this.addButton(50,50,50,50);
    this.addButton(50,50,110,50);
  }

  void draw(){
    for (Scene s: scenes){
      s.draw();
    }
    for (Button b: buttons){
      b.draw();
    }
  }

}
