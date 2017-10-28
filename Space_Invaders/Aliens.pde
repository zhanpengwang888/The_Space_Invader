public class Aliens extends Sprites implements Movable{
   private int score;
   PImage img;
   int speed;
   
  public Aliens (int x, int y, int spe)
  {
    super(x,y);
    speed=spe;
  }
  public Aliens(int x, int y, int score, int sp)
  {
    super(x,y);
    this.score=score;
    speed=sp;
  }
  void move()
  {
    
    if(x>1390)
    {
     changeXDirection();
    } 
    if(20>x)
    {
      changeXDirection();
    }
     x +=speed;
  }
  
  void changeXDirection() {speed*=-1;}
  
  void setImage()
  {
    img=loadImage("Aliens.png");
    img.resize(70,70);
  }
  void setX(int x1)
  {
    x=x1;
  }
  void setY(int y1)
  {
    y=y1;
  }
  void display()
  {
    image(img,x,y);
  }
  int getScore()
  {
    return score;
  }
  
  boolean alive()
  {
    for(int i=0; i<Space_Invaders.bullets.size();i++)
    {
      if(Space_Invaders.bullets.get(i).getX()>x 
      && Space_Invaders.bullets.get(i).getX()<(x+70)
      && Space_Invaders.bullets.get(i).getY()>y
      && Space_Invaders.bullets.get(i).getY()<(y+70)
      )
      {
        Space_Invaders.bullets.remove(i);
        return false;
      }
    }
    return true;
  }
  int getX() {return x;}
  int getY() {return y;}
}