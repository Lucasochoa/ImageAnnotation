class Button{
protected String name;
protected int width,height,x,y;
protected color col;

Button(int width,int height,int x,int y,String name){
  this.name = name;
  this.width = width;
  this.height = height;
  this.x = x;
  this.y = y;
}
//getters and setters
String getName(){
  return this.name;
}
protected void draw(){
  fill(color(255));
  rectMode(CORNER);
  rect(this.x,this.y,this.width,this.height);
  fill(0);
  textSize(12);
  text("mode",337,680);
}

protected boolean isOver(int mx, int my){
  if(mx > this.x - width/2 && mx < this.x + width/2 && my > this.y - height/2 && my < this.y + height/2)return true;
  else return false;
}

 boolean isButtonClicked(){
  if (isOver(mouseX,mouseY)){
    return true;
  }
  else return false;
}

}
