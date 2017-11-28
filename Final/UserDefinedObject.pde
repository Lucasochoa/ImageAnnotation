class UserDefinedObject{
//members
  private title String;
  relationships ArrayList<Relationship>;
  points ArrayList<PVector>;
//constructors
  UserDefinedObject(){
    this.title = null;
    relationships = new ArrayList<Relationship>();
    points = new Arraylist<PVector>();
  }
  UserDefinedObject(String title){
    this.title = title;
    relationships = new ArrayList<Relationship>();
    points = new Arraylist<PVector>();
  }
//getters and setters
  String getTitle(){
    return this.title
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
