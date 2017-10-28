public class Boss extends Aliens
{
  int yspeed;
  int lives;
  public Boss(int x, int y, int score, int xspeed, int yspeed, int life)
  {
    super(x,y,score,xspeed);
    this.yspeed=yspeed;
    lives=life;
  }
  void setImage()
  {
    img=loadImage("BOSS.png");
    img.resize(120,70);
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
   if(y>500 || y<40)
    {
       changeYDirection();
    } 
      x+=speed;
      y+=yspeed;
    }
  void changeYDirection() 
  {
    yspeed *=-1;
  }
  void getShot()
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
        lives--;
      }
    }
  }
}