public class Defender extends Sprites
{
  private int numberOfLives=100;
  private int speed;
  private PImage img;
  
  public Defender(int x, int y)
  {
    super(x,y);
    speed=0;
  }
  
  public Defender(int x, int y, int xs)
  {
    super(x,y);
    speed=xs; 
  }
  
  void moveLeft()
  {
    x -=speed;
  }
  void moveRight()
  {
    x +=speed;
  }
  void setImage()
  {
    img=loadImage("Spaceship.png");
  }
  void display()
  {
    image(img,x,y);
  }
  int getSpeed()
  {
    return speed;
  }
  public int getNumOFLives()
  {
    return numberOfLives;
  }
  public void setNumOfLives()
  {
    numberOfLives=100;
  }
  void loseLife()
  {
    numberOfLives--;
  }
  void shootBullet()
  {
    Space_Invaders.bullets.add(new Bullet(x,y));
  }
  void getShot(ArrayList<Bullet> a)
  {
    //Space_Invaders.bulletsForAliens
    for(int i=0; i<a.size();i++)
    {
      if(a.get(i).getX()>x 
      && a.get(i).getX()<(x+70)
      && a.get(i).getY()>(y-40)
      && a.get(i).getY()<(y)
      )
      {
        a.remove(i);
        numberOfLives--;
      }
    }
    
  }
  
  int getX() {return x;}
  int getY() {return y;}
  
}