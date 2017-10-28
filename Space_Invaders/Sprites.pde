public abstract class Sprites{
  int x;
  int y;
  
  public Sprites(int x1, int y1){
  x=x1;
  y=y1;
  }
  public abstract void display();
  public abstract int getX();
  public abstract int getY();
}