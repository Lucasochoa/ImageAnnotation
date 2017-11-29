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
    for (PVector p: this.points){
        //fill(255,0,0);
        noFill();
        ellipse(p.x,p.y,20,20);
    }
  }

}
