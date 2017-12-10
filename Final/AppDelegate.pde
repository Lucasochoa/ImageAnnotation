class AppDelegate extends Observable{
  private Relationship globalRelationship;
  private ArrayList<Button> buttons;
  private ArrayList<Scene> scenes;
  private Scene currentScene;
  int width, height;
//contstructor
  AppDelegate(){
    super();
    globalRelationship = null;
    scenes = new ArrayList<Scene>();
    buttons = new ArrayList<Button>();
    currentScene = null;
    this.width = 400;
    this.height = 600;
  }
  String getRelationshipString(){
    return this.globalRelationship.getPreposition();
  }
  void setRelationship(Relationship r){
    this.globalRelationship = r;
    setChanged();
    notifyObservers();
  }

   void addButton(int width,int height,int x,int y,String s){
    this.buttons.add(new Button(width,height,x,y,s));
  }

  void clicked(){
    boolean trigger = false;
    for (Button b: buttons){
      trigger = b.isButtonClicked();
      if (b.isButtonClicked()){
          if (b.getName() == "right"){
            scenes.add(scenes.remove(0));
            println("clicking from right");
          }
          if (b.getName() == "left") println("clicking from left");
          break;
      }
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
    ///if (key == 'n') println("new user defined object incoming");
  }

  void setup(){
    SelectionPage selectPage = new SelectionPage();
    selectPage.setup();

    ListViewScene listViewPage = new ListViewScene(selectPage.getPhotoCaptures()); //temp

    scenes.add(listViewPage);
    scenes.add(selectPage);


    //control setup
    this.addButton(50,50,50,50,"left");
    this.addButton(50,50,110,50,"right");
  }

  void draw(){
    // for (Scene s: scenes){
    //   s.draw();
    // }
    scenes.get(scenes.size()-1).draw();

    for (Button b: buttons){
      b.draw();
    }
  }

}
