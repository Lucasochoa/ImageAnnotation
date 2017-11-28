class Relationship{
//members
  String preposition;
  UserDefinedObject object;
//constructors
  Relationship(){
    preposition = null;
    object = null;
  }
  Relationship(String a){
    if(a != " on top of " || a != " below " || a != " beside ") preposition = null;
    else preposition = a;
    object = null;
  }
  Relationship(String a, UserDefinedObject udo){
    if(a != " on top of " || a != " below " || a != " beside ") preposition = null;
    else preposition = a;
    object = udo;
  }
//getters and setters
  String getPreposition(){
    return this.preposition;
  }
  void setPreposition(String s){
    this.preposition = s;
  }
  UserDefinedObject getObject(){
    return this.object;
  }
  void setObject(UserDefinedObject o){
    this.object = o;
  }
}
