import controlP5.*;
import java.util.*;

//ControlP5 cp5;
//String textValue = "";
AppDelegate app;
PApplet publicApplet = this;

void setup(){
  //pixelDensity(displayDensity());
  size(400,700);

  app = new AppDelegate();
  app.setup();


  // cp5 = new ControlP5(this);
  // cp5.addTextfield("Input Object Name")
  //  .setPosition(20,height-40)
  //  .setAutoClear(true)
  //  ;


}

void draw(){
  app.draw();
}

void keyPressed() {
  if(key == 't'){
    //println(app.getRelationshipString());
  }
  app.keyPressed();
}

void mousePressed() {
  app.clicked();
}

// void controlEvent(ControlEvent theEvent) {
//   if(theEvent.isAssignableFrom(Textfield.class)) {
//     println("controlEvent: accessing a string from controller '"
//             +theEvent.getName()+"': "
//             +theEvent.getStringValue()
//             );
//     println("meow mix meow mix");
//   }
//}




// public void conjureDropDown(){
//
//   List l = Arrays.asList("on top of", "below", "above", "next to", "behind","inside of");
//   /* add a ScrollableList, by default it behaves like a DropdownList */
//   cp5.addScrollableList("select relationship")
//      .setPosition(width-200, 0)
//      .setSize(200, 100)
//      .setBarHeight(20)
//      .setItemHeight(20)
//      .addItems(l)
//      .close()
//      // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
//      ;
// }


// void controlEvent(ControlEvent theEvent) {
//   //println(theEvent);
//   //println(theEvent.getLabel());
//   println((int)theEvent.getValue());
//   int temp = ((int)theEvent.getValue());
//   // if (theEvent.isGroup()) {
//   //   println(theEvent.getGroup() + " => " + theEvent.getGroup().getValue());
//
//   String rTemp;
//   switch(temp){
//     case 0: rTemp = "on top of";
//     break;
//     case 1: rTemp = "below";
//     break;
//     case 2: rTemp = "above";
//     break;
//     case 3: rTemp = "next to";
//     break;
//     case 4: rTemp = "behind";
//     break;
//     default: rTemp = "error";
//     break;
//   }
//   app.setRelationship(new Relationship(rTemp));
//   cp5.remove("select relationship");
// }




// void dropdown(int n) {
//   /* request the selected item based on index n */
//   println(n, cp5.get(ScrollableList.class, "dropdown").getItem(n));
//
//   /* here an item is stored as a Map  with the following key-value pairs:
//    * name, the given name of the item
//    * text, the given text of the item by default the same as name
//    * value, the given value of the item, can be changed by using .getItem(n).put("value", "abc"); a value here is of type Object therefore can be anything
//    * color, the given color of the item, how to change, see below
//    * view, a customizable view, is of type CDrawable
//    */
//
//    CColor c = new CColor();
//   c.setBackground(color(255,0,0));
//   cp5.get(ScrollableList.class, "dropdown").getItem(n).put("color", c);
//   cp5.get(ScrollableList.class, "dropdown").setType(ControlP5.DROPDOWN);
// }
