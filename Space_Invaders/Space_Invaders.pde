public static boolean gameStart=true;
public static boolean restart=false;

public static int pixelSize=5;
public static int gridSize = pixelSize * 6 + 12;

public static int playerScore=0;

static ArrayList<Bullet> bullets=new ArrayList<Bullet>();

static ArrayList<Bullet> bulletsForAliens=new ArrayList<Bullet>();
 
static ArrayList<Aliens> alien=new ArrayList<Aliens>();
Aliens[][] aliens=new Aliens[7][8];
int row=7, col=8;
int temp1=40;
int temp2=120;
int gap1=100;
int gap2=60;
boolean gameInProgress = true;
 
static ArrayList<Explosion> explode=new ArrayList<Explosion>();
Explosion[][] exp=new Explosion[7][8];

static ArrayList<Boss> boss=new ArrayList<Boss>();
static ArrayList<Bullet> bulletForBoss=new ArrayList<Bullet>();

static Shelter [] shelters=new Shelter[4];
int gap=400;
int temp=40;

Defender player=new Defender(720,740,20);

void setup()
{
  size(1440,850);
  noStroke();
  frameRate(100);
  background(0);
  fill(255,0,0);
  
  player.setImage();
  
  for(int i=0; i<shelters.length;i++)
  {
    shelters[i]=new Shelter(temp,600);
    temp +=gap;
  }
  gameSetup();
  
}

void draw()
{
  
  background(0);
  fill(255,0,0);
  textSize(20);
  text("SCORE: "+playerScore, 20, 40);
 
  textSize(36);
  text("Welcome to Space Invaders", 500, 40);
  
  textSize(20);
  text("LIVES: "+player.getNumOFLives(),50 ,820);
  
  gameDriver();
  
  if(player.numberOfLives==0)
  gameOver1();
  else if(boss.size()==0 && alien.size()==0)
  gameOver2();
  
}
void gameOver1()
{
      gameStart=false;
      textSize(120);
      text("GAME OVER",500,height/2);
      textSize(60);
      text("RESTART THE GAME?",500,height/2+50);
      textSize(60);
      text("Press R.",500,height/2+100);
}
void gameOver2()
{
    gameStart=false;
    textSize(32);
    text("Congratulation!!!",500,height/2);
    textSize(32);
    text("Your score is "+playerScore+"!",500,height/2+50);
    textSize(20);
      text("RESTART THE GAME?",500,height/2+100);
      textSize(20);
      text("Press R.",500,height/2+150);
}
void reset()
{
  gameStart=true;
  pixelSize=5;
gridSize = pixelSize * 6 + 12;
row=7; col=8;
temp1=40;
temp2=120;
gap1=100;
gap2=60;
playerScore=0;
player.setNumOfLives();

bullets=new ArrayList<Bullet>();

bulletsForAliens=new ArrayList<Bullet>();
 
alien=new ArrayList<Aliens>();
aliens=new Aliens[7][8];

explode=new ArrayList<Explosion>();
exp=new Explosion[7][8];

boss=new ArrayList<Boss>();
bulletForBoss=new ArrayList<Bullet>();

}
void gameSetup()
{
  boss.add(new Boss(720,40,20000,5,5,100));
  boss.add(new Boss(40,100,20000,5,5,100));
  boss.add(new Boss(500,100,20000,5,5,100));
  boss.add(new Boss(200,400,20000,5,5,100));
  for(int row=0; row<aliens.length;row++)
  {
    
    for(int col=0; col<aliens[0].length; col++)
    {
    aliens[row][col]=new Aliens(temp1, temp2, 100,2);
    exp[row][col]=new Explosion(temp1, temp2,2);
    temp1+=gap1; 
    }
    temp1=40;
    temp2+=gap2;
  } 
  
  conversionFrom2DArrayToArrayList();
  for(int k=0; k<aliens.length;k++)
  {
    for(int j=0; j<aliens[k].length;j++)
    {
    aliens[k][j].setImage();
    exp[k][j].setImage();
    }
  }
  
  for(Boss b: boss)
  {
    b.setImage();
  }
}

void gameDriver()
{
  player.display();
  
  for(Shelter a: shelters)
  {
    a.display();
  }
  
  if(gameStart){
    
  for(int i=0; i<alien.size(); i++)
  {
    if(!alien.get(i).alive())
    {
      explode.get(i).display();
      explode.remove(i);
      alien.remove(i);
      playerScore +=100;
    }
    else
    {
      alien.get(i).display();
      alien.get(i).move();
      explode.get(i).move();
    }
  }
  
  shootingWithThePresenceOfShelters(bullets);
  
  shoot();  
  
  shootingSheltersForAliens(bulletsForAliens);
   
    if(alien.size()==0)
    {
      textSize(30);
      text("Boss 1's life: "+boss.get(0).lives,50,100);
      textSize(30);
      text("Boss 2's life: "+boss.get(1).lives,50,150);
      textSize(30);
      text("Boss 3's life: "+boss.get(2).lives,1150,100);
      textSize(30);
      text("Boss 4's life: "+boss.get(3).lives,1150,150);
      for(int i=0; i<boss.size();i++)
      {
        boss.get(i).getShot();
        if(boss.get(i).lives==0)
        {
        boss.remove(i);
        playerScore+=20000;
        } else
        {
         boss.get(i).display();
         boss.get(i).move();
         bulletForBoss.add(new Bullet(boss.get(i).getX(),boss.get(i).getY()));
         shootingSheltersForAliens(bulletForBoss);
        }
      }
    }
    
    player.getShot(bulletsForAliens);
    player.getShot(bulletForBoss);
  } 
}
void conversionFrom2DArrayToArrayList()
{
  for(Aliens[] al: aliens)
  {
    for(Aliens a: al)
    {
      alien.add(a);
    }
  }
  for(Explosion[] ex:exp)
  {
    for(Explosion e: ex)
      explode.add(e);
  }
}

void keyPressed()
{
  if (keyPressed && keyCode=='R')
  {
   reset();
   gameStart=true;
   gameSetup();
   gameDriver();
  }
  
  if(gameStart){
  if(keyPressed && keyCode==LEFT)
  {
  if(player.x>0)
    player.moveLeft();
  }
  if(keyPressed && keyCode==RIGHT)
  {
    if(player.x<1370)
    player.moveRight();
  }
  if(keyPressed && key== ' ')
  {
    player.shootBullet();
  }
  }
}


void shootingWithThePresenceOfShelters(ArrayList<Bullet> a)
{
  for(int j=0; j<shelters.length; j++)
    {
      for(int i=0; i<a.size();i++)
      {
        if(shelters[j].getX()<=a.get(i).getX()
        && a.get(i).getX()<(150+shelters[j].getX())
        && a.get(i).getY()<(shelters[j].getY()+50))
        {
         a.remove(i);
        }
        else 
        {
          a.get(i).display();
        }
    }
  }
  
}

void shootingSheltersForAliens(ArrayList<Bullet> a)
{
  for(int i=0; i<shelters.length; i++)
    {
      for(int j=0; j<a.size();j++)
      {
        if(shelters[i].getX()<=a.get(j).getX()
        && a.get(j).getX()<(150+shelters[i].getX())
        && a.get(j).getY()>(shelters[i].getY()))
        {
         a.remove(j);
        }
        else 
        {
        a.get(j).displayForAliens();
        }
    }
  }
}

void shoot()
{
  if(randomizer()>=0)
  {
    Aliens shooting=alien.get(randomizer());
    bulletsForAliens.add(new Bullet(shooting.getX(),shooting.getY())); 
  }
}
 
int randomizer()
  {
      int randomAlienIndex = (int) random(0,alien.size());
      randomAlienIndex = constrain(randomAlienIndex, 0,
      alien.size() - 1);
    return randomAlienIndex;
  }