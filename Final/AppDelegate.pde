class AppDelegate{
  private annotatedCaptures ArrayList<PhotoCapture>;
  width, height int;
//contstructor
  AppDelegate(){
    annotatedCaptures = new ArrayList<PhotoCapture>();
    this.width = 400;
    this.height = 600;
  }
//getters and setters
  void addPhotoCapture(PhotoCapture p){
    this.annotatedCaptures.add(p);
  }

}