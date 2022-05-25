import processing.sound.*;


SoundFile hurt;


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
Enemy[] enemyList;

boolean playing = false;


Sprite background;
public String menu1 = "Press Start!";
public String menu2 = "Paused";



//initialize them in setup().
void setup(){
  size(800, 800);
  
  playButton = new Button("Play", width/2, height/2, 100, 40, 150, 255, 60);
  
  background = new Sprite("background.png", 1.3, width/2, height/2);
  
  hurt = new SoundFile(this, "hurt.wav");
  
  imageMode(CENTER); 
  
  s1 = new Sprite("player.png", 1.0, width/2, height/2);
  enemyList = new Enemy[10];
  
  for(int i = 0; i < 10; i++){
    enemyList[i] = new Enemy("enemy.png", (float)Math.random()*width, (float)Math.random()*height, 100, random(0, 360), (float)(Math.random()*2) + 2); //THIS DOESN"T WORK AND I DONT KNOW WHY. 
  }
}

// modify and update them in draw().
void draw(){
  
  
  
  println(mouseX, mouseY);
  if(playing){
        background(255);
        background.display();
        s1.display();
        s1.update();
        
        for(int g = 0; g < 10; g++){
          enemyList[g].display();
          enemyList[g].update();
          if(enemyList[g].Collision())
          {
            textSize(40);
            text("Game Over!", width/2, height/2);
          }
        }
      }
   else
    {
      playButton.update();
      print(playButton.clicked, playButton.hovered);
      if(playButton.clicked){playing = true;}
      playButton.display();
    }
  }
  


void keyPressed(){
// move character using 'a', 's', 'd', 'w'. Also use MOVE_SPEED above.\
  
  
  

 
  println(key);
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
}
