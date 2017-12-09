class Button{
protected int width,height,x,y;
protected color col;

Button(int width,int height,int x,int y){
  this.width = width;
  this.height = height;
  this.x = x;
  this.y = y;
}

protected void draw(){
  fill(color(255,0,0));
  rectMode(CENTER);
  rect(this.x,this.y,this.width,this.height);
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
