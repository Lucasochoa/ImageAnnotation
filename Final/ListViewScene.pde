class ListViewScene extends Scene implements ControlListener{
private ArrayList<PhotoCapture> captures;
private ControlP5 p5Controllers;
UserDefinedObject selectedUDO;

  ListViewScene(ArrayList<PhotoCapture> photoCaptures){
      this.p5Controllers = new ControlP5(publicApplet);
      this.captures = photoCaptures;
      this.selectedUDO = null;
  }
  void provideInfo(){
    println(this.captures);
  }

  void setup(){
    this.p5Controllers.addListener(this);
    conjureList();
    conjureRelationshipList();



    //customize(d1);
    //d1.hide();
    //println("working from list view scene");
  }


  void draw(){
    background(51);
    if(this.selectedUDO != null){
      fill(50, 239, 201); //blue
      rectMode(CORNER);
      rect(0,20,width,30,10);
      fill(0);
      textSize(15);
      text(this.selectedUDO.getTitle(),20,40);
      //rectMode(CORNER);

      // int padding = 50;
      // for(int i = 0; i < this.selectedUDO.relationships.size();i++){
      //   rect(160,(i*40)+padding,100,30,10);
      // }



    }

    // PhotoCapture selectedCapture = captures.get(captures.size()-1);
    // int padding = 20;
    //
    // textSize(30);
    // background(51);
    //
    // rectMode(CORNER);
    //
    // for (int i = 0; i < selectedCapture.definedObjects.size(); i++){
    //     fill(10,100,100);//fill for tableview cells
    //     rect(padding,((height-40)/selectedCapture.definedObjects.size()*i) + (padding * i),
    //     width-padding*2,(height-40)/selectedCapture.definedObjects.size(),20);
    //     fill(255);
    //     text(selectedCapture.definedObjects.get(i).getTitle(),padding * 2, ((height/selectedCapture.definedObjects.size())*i)+padding * 2);
    //     // try{
    //     //     text(selectedCapture.definedObjects.get(i).relationships.get(0).getPreposition(),padding * 2, ((height/selectedCapture.definedObjects.size())*i)+padding * 2);
    //     // }
    //     // catch(IndexOutOfBoundsException e){
    //     //   println("error");
    //     // }
    //
    // }
  }
  void keyPressed(){
    if (key == 'e') println("working from list view");
  }
  void clicked(){
    //println("clicked handeler");
  }
  void hideController(){
    println("hiding controller");
    this.p5Controllers.getController("list of labeled objects").hide();
    this.p5Controllers.remove("list of labeled objects");
    this.p5Controllers.getController("list of rleationships").hide();
    this.p5Controllers.remove("list of rleationships");
    //this.p5Controllers.getController("list of rleationships").show();
  }
  void show(){
    println("showing controller");
    conjureList();
    conjureRelationshipList();
    this.p5Controllers.getController("list of rleationships").show();
    this.p5Controllers.getController("list of labeled objects").show();
  }
  void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.

  // if (theEvent.isGroup()) {
  //   // check if the Event was triggered from a ControlGroup
  //   println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  // }
  if (theEvent.isController()) {
    int temp = ((int)theEvent.getValue());
    //rintln(temp);
    PhotoCapture selectedCapture = captures.get(captures.size()-1);
    this.selectedUDO = selectedCapture.definedObjects.get(temp);
    println(this.selectedUDO.relationships.size());
    conjureRelationshipList();
    this.p5Controllers.getController("list of rleationships").show();
    //println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}
  void conjureRelationshipList(){
    DropdownList d2 = this.p5Controllers.addDropdownList("list of rleationships")
          .setPosition(0,300)
          .setSize(width,height-100)
          ;
    if(this.selectedUDO!= null){
      if (!this.selectedUDO.relationships.isEmpty()){
          for (int i = 0; i < this.selectedUDO.relationships.size(); i++){
            d2.addItem(this.selectedUDO.relationships.get(i).getPrintout(),i);
          }
      }
    }
    customize(d2,"objet relationships");
    d2.hide();
  }

  void conjureList(){

    DropdownList d1 = this.p5Controllers.addDropdownList("list of labeled objects")
          .setPosition(0,0)
          .setSize(width,height)
          ;
    PhotoCapture selectedCapture = captures.get(captures.size()-1);
    for (int i=0; i<selectedCapture.definedObjects.size(); i++) {
        d1.addItem(selectedCapture.definedObjects.get(i).getTitle() +" index "+ i, i);
    }
    customize(d1, "list of labeled objects");
    d1.hide();
  }


  void customize(DropdownList ddl,String s) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.getCaptionLabel().set(s);
  // for (int i=0;i<20;i++) {
  //   ddl.addItem("item "+i, i);
  // }
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
  }
}
