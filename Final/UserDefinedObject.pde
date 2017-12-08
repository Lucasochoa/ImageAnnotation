class UserDefinedObject{
//members
  private String title;
  ArrayList<Relationship> relationships;
  ArrayList<PVector> points;
//constructors
  UserDefinedObject(){
    this.title = null;
    relationships = new ArrayList<Relationship>();
    points = new ArrayList<PVector>();
  }

  UserDefinedObject(String title){
    this.title = title;
    relationships = new ArrayList<Relationship>();
    points = new ArrayList<PVector>();
  }
//getters and setters
  String getTitle(){
    return this.title;
  }
  void setTitle(String title){
    this.title = title;
  }
  public void draw(){

      for (int i = 0; i < points.size(); i++){
        PVector p = points.get(i);
        PVector p2 = points.get(i);
        if(i != points.size() -1){
            p2 = points.get(i+1);
        }
        noFill();
        ellipse(p.x,p.y,20,20);
        line(p.x,p.y,p2.x,p2.y);
      }
      if(points.size() > 1){
          line(points.get(points.size()-1).x,points.get(points.size()-1).y,points.get(0).x,points.get(0).y);
      }
  }

}
