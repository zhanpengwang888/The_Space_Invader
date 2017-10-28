public class Explosion extends Aliens
{
  PImage img;
  
  Explosion(int x, int y, int speed)
  {
  super(x,y,speed);
  
  }
  void setImage()
  {
    img=loadImage("Explosion.png");
    img.resize(120,120);
  }
  void display() 
  {
    image(img,x,y);
  }
  int getX()
  {
    return x;
  }
  int getY() {return y;}
}