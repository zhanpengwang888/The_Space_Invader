public class Bullet extends Sprites
{
  Bullet(int x, int y)
  {
    super(x+Space_Invaders.gridSize/2-4,y);
  }
  void display()
  {
    fill(#FFFFFF);
    rect(x,y,Space_Invaders.pixelSize,Space_Invaders.pixelSize);
    y -=Space_Invaders.pixelSize;
  }
  void displayForAliens()
  {
    fill(#E30707);
    rect(x+20,y,5,5);
    y +=3;
  }
  int getX()
  {
  return x;
  }
  int getY()
  {
    return y;
  }
}