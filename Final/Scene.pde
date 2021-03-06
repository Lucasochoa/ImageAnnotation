abstract class Scene{
private String name;
private int index;

  abstract void setup();
  abstract void draw();
  abstract void keyPressed();
  abstract void clicked();
  abstract void show();
  abstract void hideController();

}
