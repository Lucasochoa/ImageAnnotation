class AppDelegate{
  private ArrayList<PhotoCapture> annotatedCaptures;
  int width, height;
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
