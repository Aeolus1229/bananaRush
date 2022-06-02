



import processing.sound.*;





SoundFile hurt;
SoundFile music;
SoundFile collectSound;
SoundFile monkeyNoise;
SoundFile menuMusic;





float MOVE_SPEED = 5; 
final static float DASH_SPEED = 100;

private String dashDirection = " ";



//declare global variables
Sprite s1;
PImage arm1;
PImage arm2;
PImage hand1;
PImage hand2;
Button playButton;
Button shopButton;
Enemy[] enemyList;
Collectable[] collectList;
Button shopClose;

Button upgradeSize;
Button upgradePoints;
Button upgradeSpeed;
Button upgradeHealth;

float grabX;
float grabY;

float elbowX;
float elbowY;

int highscore = 0;
int collectCount = 1;
int enemyCount = 10;
int score = 0;
int health = 20;

int spawnX = 0;
int spawnY = 0;

float monkeySize = 1.0;

int money = 0;
int previousScore = -1;

color color_under_mouse;

int direction = 0;

boolean playing = false;

public boolean hitboxes;

boolean funi = false;
Sprite background;
public String menu1 = "Press Start!";
public String menu2 = "Paused";

boolean shopAvailable;
boolean shopOpen;

int maxHealth = 20;
int enemyDamage = 1;

String  data;
//nice
int bananaValue = 1;

String[] fontList = PFont.list();

//initialize them in setup().
void setup(){
  
      arm1 = loadImage("arm1.png");
      arm2 = loadImage("arm1.png");
      hand1 = loadImage("hand2.png");
      hand2 = loadImage("hand2.png");
  
  //print("setup");
  size(1600, 800);
  
  surface.setTitle("Banana Rush " + highscore);
  stroke(0);
  
  PImage icon = loadImage("monkey.png");
  
  enemyCount = 10;
  
  noSmooth();
  
  hitboxes = false;
 
  shopButton = new Button("Shop", width/2, height-200, 100, 40, 150, 255, 60, 24, 'b');
  shopClose = new Button("X", width-400, height/3.9, 20, 20, 255, 0, 0, 8, 'b');
  playButton = new Button("Play", width/2, height/2, 100, 40, 150, 255, 60, 24, 'b');
  
  upgradeSize = new Button("Shrink - 50$", width/2, 4*height/10, width/5, height/14, 10, 200, 200, 24, 'b');
  upgradePoints = new Button("More bana per bana - 200$", width/2, 7*height/10, width/5, height/14, 10, 200, 200, 12, 'b');
  upgradeSpeed = new Button("Speed - 75$", width/2, 5*height/10, width/5, height/14, 10, 200, 200, 24, 'b');
  upgradeHealth = new Button("Max Health - 100$", width/2, 6*height/10, width/5, height/14, 10, 200, 200, 18, 'b');
  
  background = new Sprite("background.png", 1.3, width/2, height/2);
  
  hurt = new SoundFile(this, "hurt.wav");
  music = new SoundFile(this, "music.wav");
  collectSound = new SoundFile(this, "collect.wav");
  monkeyNoise = new SoundFile(this, "monkeynoise.wav");
  menuMusic = new SoundFile(this, "menu.wav");
  
  imageMode(CENTER); 
  
  surface.setIcon(icon);
  
  s1 = new Sprite("monkey.png", monkeySize, width/2, height/2);
  enemyList = new Enemy[1000];
  collectList = new Collectable[1];
  
  menuMusic.loop();
  
  for(int i = 0; i < 1000; i++){
    
    direction = (int)random(1, 4);
    if(direction == 1)
    {spawnX = (int)(Math.random()*width/2 + width/0.5);
    spawnY = (int)(Math.random()*height);
    }
    else if(direction == 2){spawnX = (int)(Math.random()*width);
    spawnY = (int)(Math.random()*(-height/2) + height/0.5);
    } 
    else if(direction == 3){spawnX = (int)(Math.random()*(-width));
    spawnY = (int)(Math.random()*(-height/2) + height/0.5);
    }else if(direction == 4){spawnX = (int)(Math.random()*(-width/2) + width/0.5);
    spawnY = (int)(Math.random()*(height));
    } 
    
    
    
    
    enemyList[i] = new Enemy("frame", spawnX, spawnY, 100, random(0, 360), (float)(Math.random()*2) + 2, (float)((Math.random()-0.50)/8)); //THIS DOESN"T WORK AND I DONT KNOW WHY. 
    
  }
  for(int i = 0; i < collectCount; i++)
  {
  collectList[i] = new Collectable(random(0, width), random(0, height));
  }
}

// modify and update them in draw().
void draw(){
  
  
  
     
        
            

  
  
  //print("draw");
    //surface.setLocation((int)random(0, 1000), (int)random(0, 1000)); //Dont uncomment this
  

  if(playing){
  
        if(health <= 0)
        {
          if(score > highscore)
          {
            highscore = score;
          }
          
          if(!shopAvailable){shopAvailable = true;}
          
          
          money += score;
          
          
          previousScore = score;
          music.stop();
          monkeyNoise.play();
          score = 0;
          playing = false;
          health = maxHealth;
          setup();
          
        }
        background(#637E4E);
        

        
        
        
        
        
        
        
        if(health > maxHealth){health = maxHealth;}
        
        //background.display();
        
        /*
          grabX = mouseX;
          grabY = mouseY;
          
          stroke(100, 100, 100);

          println(distPointX((float)((Math.atan((mouseY - s1.y)/(mouseX - s1.x)))), arm1.width*2));      
          
          if((dist(mouseX, mouseY, s1.x, s1.y) > arm1.width*2))
          {
            
                      grabX = distPointX((float)((Math.atan((mouseY - s1.y)/(mouseX - s1.x)))*180/Math.PI), arm1.width*2); // DOESN"T WORK
                      grabY = -(1 + s1.x - grabX - s1.y);
                      
                      print(grabX + " " + grabY);
            
          }
          
          pushMatrix();
          translate(((s1.x + grabX)/2), ((s1.y + grabY)/2));
          rotate((float)((Math.atan((grabY - s1.y)/(grabX - s1.x)))));
          image(arm1, 0, 0);
          popMatrix();
          
          */
          
        
        s1.display();
        s1.update();
         fill(255, 0, 0);
         rect(s1.x - maxHealth, s1.y - 40, maxHealth*2, 10);
         
         fill(0, 255, 0);
         rect(s1.x - maxHealth, s1.y - 40, max(min(health*2, maxHealth*2), 0), 10);
        
        for(int d = 0; d < collectCount; d++){
          collectList[d].display();
          collectList[d].update();
          if(collectList[d].collision)
          {
            score += bananaValue;
            health += bananaValue/2;
            println(score);
            
            if(score % 5 == 0 && enemyCount < 1000)
            {
             enemyCount++;
            
            
            }
          }
          
        }
        
        for(int g = 0; g < enemyCount; g++)
        {
          enemyList[g].update();
          enemyList[g].display();
        }
        
        if(color(get((int)(s1.x + s1.w/2), (int)(s1.y))) == enemyList[0].snakeColor1 || color(get((int)(s1.x + s1.w/2), (int)(s1.y))) == enemyList[0].snakeColor2 || color(get((int)(s1.x + s1.w/2), (int)(s1.y))) == enemyList[0].snakeColor3){
            health -= enemyDamage;
            println("right");}
        else if(color(get((int)(s1.x + s1.w/2), (int)(s1.y))) == enemyList[0].snakeColor1 || color(get((int)(s1.x + s1.w/2), (int)(s1.y))) == enemyList[0].snakeColor2 || color(get((int)(s1.x + s1.w/2), (int)(s1.y))) == enemyList[0].snakeColor3){
            health -= enemyDamage;
          println("left");}
        else if(color(get((int)(s1.x), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor3){
            health -= enemyDamage;
          println("bottom");}
        else if(color(get((int)(s1.x), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor3){
            health -= enemyDamage;
          println("top");}
        else if(color(get((int)(s1.x + s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x + s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x + s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor3){
            health -= enemyDamage;
          println("top right");}
        else if(color(get((int)(s1.x - s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x - s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x - s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor3){
            health -= enemyDamage;
          println("top left");}
        else if(color(get((int)(s1.x + s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x + s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x + s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor3){
            health -= enemyDamage;
          println("bottom right");}
        else if(color(get((int)(s1.x - s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x - s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x - s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor3){
            health -= enemyDamage;
          println("bottom left");}

       /*
       color_under_mouse = get(mouseX, mouseY); //COLOR COLLISION _WILL_ WORK
      
      fill(color_under_mouse);
      rect(100, 100, 30, 30);
      
      if(red(color_under_mouse) != 255 && green(color_under_mouse) != 255 && blue(color_under_mouse) != 255){
      println(red(color_under_mouse), green(color_under_mouse), blue(color_under_mouse));
      }
        */
        
        fill(0);
        textSize(30);
        text(score, 30, 30);
        }
      
   else if(shopOpen)
        {
          //print("shop");
          shop();
        }
   else
    {
      //print("else");
                background(150);
          if(!playing && !shopOpen){
          image(loadImage("thumbnail.png"), width/2, height/2);
          
          textSize(40);
          text("Highscore - " + Integer.toString(highscore), width/2, height/1.5);
          text("Banana Rush", width/2, height /3.5);
          
          if(previousScore != -1){
          text("Previous Score - " + Integer.toString(previousScore), width/2, height/1.2);}
          
          }
      
      
      
      playButton.update();

      if(playButton.clicked){
      menuMusic.stop();
      music.loop();
      playing = true;}
      playButton.display();
      if(shopAvailable){
        shopButton.update();
        shopButton.display();
        
        if(shopButton.clicked)
        {
          shopOpen = true;
        }
        
      }
      

    }
    if(funi){image(loadImage("image0.png"), (float)mouseX, (float)mouseY);}
  }
  


void shop()
{
  
  //fill(150);
  rect(width/4, height/4, width/2, height/2);
  
  fill(0, 0, 0);
  textSize(24);
  text("SHOP - " + money + "$", width/2, height/3.4);
  
  shopClose.update();
  shopClose.display();
  
  
  upgradeSize.update();
  upgradeSize.display();
  
  upgradePoints.update();
  upgradePoints.display();
  
    upgradeSpeed.update();
  upgradeSpeed.display();
  
    upgradeHealth.update();
  upgradeHealth.display();
  
  if(shopClose.clicked){shopOpen = false;}
  
  if(upgradePoints.clicked && money >= 200){
  money -= 200; 
  bananaValue += 2;
  }
  if(upgradeSpeed.clicked && money >= 75){
  money -= 75; 
  MOVE_SPEED += 2;
  }
  if(upgradeSize.clicked && money >= 50){
  money -= 50; 
  s1.w /= 2;
  s1.h /= 2;
  monkeySize /= 2;
  }
    if(upgradeHealth.clicked && money >= 100){
  money -= 100; 
  maxHealth += 10;
  health = maxHealth;
  }
  
  
}

void keyPressed(){
// move character using 'a', 's', 'd', 'w'. Also use MOVE_SPEED above.\
  
  
  
  if(key == 'u'){
    score += bananaValue; 

                if(score % 5 == 0 && enemyCount < 1000)
            {
             enemyCount++;
            
            
            }
  }
  

  if(key == 'a'){
    s1.change_x = -MOVE_SPEED; 
    dashDirection = "a";
    
  }
  if(key == 'd'){
    s1.change_x = +MOVE_SPEED; 
    if(dashDirection == "s" || dashDirection == "w")
    {
      dashDirection += "d";
    }
    else{
    dashDirection = "d";
    }
  }

  if(key == 's'){
    s1.change_y = +MOVE_SPEED; 
        if(dashDirection == "d" || dashDirection == "a")
    {
      dashDirection += "s";
    }
    else{
    dashDirection = "s";
    }
  }
  if(key == 'w'){
    s1.change_y = -MOVE_SPEED; 
    if(dashDirection == "a" || dashDirection == "d")
    {
      dashDirection += "w";
    }
    else{
    dashDirection = "w";
    }
  }
  
  
  if(s1.x > width)
  {
    s1.x = 0;
  }
   if(s1.x < 0)
  {
    s1.x = width;
  }
  
  if(s1.y > height)
  {
    s1.y = 0;
  }
   if(s1.y < 0)
  {
    s1.y = height;
  }

  
  /*if(key == ' ')
  {
    if(dashDirection == "a")
    {
      s1.center_x -= DASH_SPEED; 

    }
    else if(dashDirection == "s")
    {
      s1.center_y += DASH_SPEED; 

    }
    else if(dashDirection == "d")
    {
      s1.center_x += DASH_SPEED; 

    }
    else if(dashDirection == "w")
    {
      s1.center_y -= DASH_SPEED; 

    }
    else if(dashDirection == "as" || dashDirection == "sa")
    { 
      s1.center_y += DASH_SPEED;
      s1.center_x -= DASH_SPEED;

    }
    else if(dashDirection == "aw" || dashDirection == "wa")
    {
      s1.center_y -= DASH_SPEED;
      s1.center_x -= DASH_SPEED;

    }
    else if(dashDirection == "ds" || dashDirection == "sd")
    {
      s1.center_y += DASH_SPEED;
      s1.center_x += DASH_SPEED;

    }
    else if(dashDirection == "dw" || dashDirection == "dw")
    {
      s1.center_y -= DASH_SPEED;
      s1.center_x += DASH_SPEED;
      
    }
    else
    {
    println("Failed");
    }
    
  }
  */
  

  
  
}

void keyReleased(){
// if key is released, set change_x, change_y back to 0


  if(key == 'a'){
    s1.change_x = 0; 

    
  }

  if(key == 'd'){
    s1.change_x = 0; 

    
  }
  if(key == 's'){
    s1.change_y = 0; 

    
  }
  if(key == 'w'){
    s1.change_y = 0;

  }
  if(key == 'b')
  {
    if(hitboxes){hitboxes = false;}
    else{hitboxes = true;}
  }
    if(key == 'p')
  {
    if(funi){funi = false;}
    else{funi = true;}
  }
  
}
