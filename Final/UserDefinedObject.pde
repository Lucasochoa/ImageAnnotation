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
  // void addRelationship(Relationship r){
  //   relationships.add(r);
  // }
  // void addPoint(PVector p){
  //   points.add(p);
  //}

}
