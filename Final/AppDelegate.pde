class AppDelegate{
  private ArrayList<Button> buttons;
  private ArrayList<Scene> scenes;
  private Scene currentScene;
  int width, height;
//contstructor
  AppDelegate(){
    scenes = new ArrayList<Scene>();
    buttons = new ArrayList<Button>();
    currentScene = null;
    this.width = 400;
    this.height = 600;
  }
//getters and setters

   void addButton(int width,int height,int x,int y,String s){
    this.buttons.add(new Button(width,height,x,y,s));
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

  void keyPressed(){
    for (Scene s: scenes){
      s.keyPressed();
    }
    if (key == 'n') println("new user defined object incoming");
  }

  void setup(){
    SelectionPage selectPage = new SelectionPage();
    selectPage.setup();

    scenes.add(selectPage);

    this.addButton(50,50,50,50,"left");
    this.addButton(50,50,110,50,"right");
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
