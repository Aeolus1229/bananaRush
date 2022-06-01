



import processing.sound.*;





SoundFile hurt;
SoundFile music;
SoundFile collectSound;
SoundFile monkeyNoise;
SoundFile menuMusic;

/* Controlling the Sprite Lab 
   
   There are two versions of this lab:
   1) Friendly Version. More helper code is provided in lab template.
   2) More Challenging Version. Less helper code is provided.
   
   This is the friendly version.
   For more detail, see the tutorial: https://youtu.be/OAjyunGPW_s
   
   Complete the code as indicated by the comments.
   Do the following:
   1) Implement keyPressed and keyReleased below to control the Sprite
      In the video, I used the variable "keyCode" and the arrow keys(UP,DOWN,LEFT,RIGHT).
      In this lab, use the variable "key" and characters 'a', 's', 'd' and 'w' to move
      the character. 
*/

final static float MOVE_SPEED = 5; 
final static float DASH_SPEED = 100;

private String dashDirection = " ";



//declare global variables
Sprite s1;
Button playButton;
Button shopButton;
Enemy[] enemyList;
Collectable[] collectList;
Button shopClose;


int highscore = 0;
int collectCount = 1;
int enemyCount = 10;
int score = 0;
int health = 20;

color color_under_mouse;

boolean playing = false;

public boolean hitboxes;

boolean funi = false;
Sprite background;
public String menu1 = "Press Start!";
public String menu2 = "Paused";

boolean shopAvailable;
boolean shopOpen;

String  data;

String[] fontList = PFont.list();

//initialize them in setup().
void setup(){
  size(1600, 800);
  stroke(0);
  
  enemyCount = 10;
  
  noSmooth();
  
  hitboxes = false;
 
  shopButton = new Button("Shop", width/2, height-200, 100, 40, 150, 255, 60, 24, 'b');
  shopClose = new Button("", width-400, height/3.9, 20, 20, 255, 0, 0, 4, 'b');
  playButton = new Button("Play", width/2, height/2, 100, 40, 150, 255, 60, 24, 'b');
  
  background = new Sprite("background.png", 1.3, width/2, height/2);
  
  hurt = new SoundFile(this, "hurt.wav");
  music = new SoundFile(this, "music.wav");
  collectSound = new SoundFile(this, "collect.wav");
  monkeyNoise = new SoundFile(this, "monkeynoise.wav");
  menuMusic = new SoundFile(this, "menu.wav");
  
  imageMode(CENTER); 
  
  s1 = new Sprite("player1.png", 1.0, width/2, height/2);
  enemyList = new Enemy[30];
  collectList = new Collectable[1];
  
  menuMusic.loop();
  
  for(int i = 0; i < 30; i++){
    enemyList[i] = new Enemy("frame", (float)Math.random()*width, (float)Math.random()*height, 100, random(0, 360), (float)(Math.random()*2) + 2, (float)((Math.random()-0.50)/8)); //THIS DOESN"T WORK AND I DONT KNOW WHY. 
    
  }
  for(int i = 0; i < collectCount; i++)
  {
  collectList[i] = new Collectable(random(0, width), random(0, height));
  }
}

// modify and update them in draw().
void draw(){
  
  
  

  

  if(playing){
  
        if(health <= 0)
        {
          if(score > highscore)
          {
            highscore = score;
          }
          
          if(!shopAvailable){shopAvailable = true;}
          
          music.stop();
          monkeyNoise.play();
          score = 0;
          playing = false;
          health = 20;
          setup();
          
        }
        background(255);
        

        
        
        //background.display();
        s1.display();
        s1.update();
         fill(255, 0, 0);
         rect(s1.x - 20, s1.y - 40, 40, 10);
         
         fill(0, 255, 0);
         rect(s1.x - 20, s1.y - 40, health*2, 10);
        
        for(int d = 0; d < collectCount; d++){
          collectList[d].display();
          collectList[d].update();
          if(collectList[d].collision)
          {
            score++;
            health++;
            println(score);
            
            if(score % 5 == 0)
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
            health--;
            println("right");}
        else if(color(get((int)(s1.x + s1.w/2), (int)(s1.y))) == enemyList[0].snakeColor1 || color(get((int)(s1.x + s1.w/2), (int)(s1.y))) == enemyList[0].snakeColor2 || color(get((int)(s1.x + s1.w/2), (int)(s1.y))) == enemyList[0].snakeColor3){
            health--;
          println("left");}
        else if(color(get((int)(s1.x), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor3){
            health--;
          println("bottom");}
        else if(color(get((int)(s1.x), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor3){
            health--;
          println("top");}
        else if(color(get((int)(s1.x + s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x + s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x + s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor3){
            health--;
          println("top right");}
        else if(color(get((int)(s1.x - s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x - s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x - s1.w/2), (int)(s1.y - s1.h/2))) == enemyList[0].snakeColor3){
            health--;
          println("top left");}
        else if(color(get((int)(s1.x + s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x + s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x + s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor3){
            health--;
          println("bottom right");}
        else if(color(get((int)(s1.x - s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor1 || color(get((int)(s1.x - s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor2 || color(get((int)(s1.x - s1.w/2), (int)(s1.y + s1.h/2))) == enemyList[0].snakeColor3){
            health--;
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
        
        if(funi){image(loadImage("image0.png"), (float)mouseX, (float)mouseY);}
        
      }
      
   else if(shopOpen)
        {
          shop();
        }
   else
    {
                background(150);
          if(!playing && !shopOpen){
          image(loadImage("thumbnail.png"), width/2, height/2);
          
          textSize(40);
          text("Highscore - " + Integer.toString(highscore), width/2, height/1.5);
          text("Banana Rush", width/2, height /3.5);
          
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
  }
  


void shop()
{
  
  //fill(150);
  rect(400, 200, 800, 400);
  
  shopClose.update();
  shopClose.display();
  
  if(shopClose.clicked){shopOpen = false;}
  
  
  
}

void keyPressed(){
// move character using 'a', 's', 'd', 'w'. Also use MOVE_SPEED above.\
  
  
  

  

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
