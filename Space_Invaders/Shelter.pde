public class Shelter extends Sprites
{
  
  public Shelter(int x, int y)
  {
    super(x,y);
  }
  void display()
  {
    fill(#FFFFFF);
    rect(x,y,150,50);
  }
  int getX() {return x;}
  int getY() {return y;}
}