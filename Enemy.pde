


public class Enemy{
  
  
  float y, x, size, speed, angle, yIncrease, xIncrease, w, h, rotSpeed;
  PImage image;
  String filename;
  int frame;
  color snakeColor1;
  color snakeColor2;
  color snakeColor3;
  
  
  public Enemy(String filename, float x, float y, float size, float angle, float speed, float rotSpeed){
    
    this.snakeColor1 = color(75.0, 105.0, 47.0);
    this.snakeColor2 = color(106.0, 190.0, 48.0);
    this.snakeColor3 = color(153.0, 229.0, 80.0);
    
    this.filename = filename;
    this.size = size;
    this.speed = speed;
    this.angle =  angle * (float)(Math.PI/180);
    this.y = y;
    this.x = x;
    this.frame = (int)Math.random()*14;
    this.w = 20;
    this.h = 40;
    this.rotSpeed = rotSpeed;
    
  }
  
  public void display()
  {
    
    
    
    noStroke();
    fill(255, 255, 0);
    
    pushMatrix();
    
    translate(x, y);
    //rotate((float)Math.PI * 2);
    //rotate((float)(90 * (2/Math.PI)));
    rotate(angle);
    image(image, 0, 0, size, size);
    //ellipse((float)X, (float)Y, (float)Size*4, (float)Size*4);
    
    popMatrix();
     
  }
  
  public void update(){
    frame++;
    
    angle += rotSpeed;
    
    if(frame > 14)
    {
     frame = 0;
    }
    if(frame % 2 == 0){
    image = loadImage(filename +"_"+ (frame/2) + ".gif");
    }
    else
    {
      image = loadImage(filename +"_"+ ((frame-1)/2) + ".gif");
    }
    
    xIncrease = ((speed + min(score/25, 4))*(float)Math.sin(angle))/(float)Math.sin(Math.PI/2);
    yIncrease = ((speed + min(score/25, 4))*(float)Math.sin(Math.PI - angle + Math.PI/2))/(float)Math.sin(Math.PI/2);
    y += yIncrease;
    x += xIncrease;
    
    
   if(x > width)
  {
    x = 0;
  }
   if(x < 0)
  {
    x = width;
  }
  
  if(y > height)
  {
    y = 0;
  }
   if(y < 0)
  {
    y = height;
  }
    
    
    
  }
   public boolean Collision()
   {  
     //print(size);
     
     /*
     
      if(x - w/2<= s1.x - s1.w/2 && s1.x - s1.w/2 <= x+w/2)
          {
            if(y-h/2 <= s1.y - s1.h/2 && s1.y - s1.h/2 <= y+h/2)
            {
              
              print("top left");
                 x = (random(0, width));
                 y = (random(0, height));
                 hurt.play();
                 return true;
            }
          }
          
       if(x - w/2<= s1.x - s1.w/2 && s1.x - s1.w/2 <= x+w/2)
          {
            if(y-h/2 <= s1.y + s1.h/2 && s1.y + s1.h/2 <= y+h/2)
            {
                print("bottom left");
                 x = (random(0, width));
                 y = (random(0, height));
                 hurt.play();
                 return true;
            }
          }
       if(x - w/2<= s1.x + s1.w/2 && s1.x + s1.w/2 <= x+w/2)
          {
            if(y-h/2 <= s1.y + s1.h/2 && s1.y + s1.h/2 <= y+h/2)
            {
              
                print("bottom right");
                 x = (random(0, width));
                 y = (random(0, height));
                 hurt.play();
                 return true;
            }
          }
              if(x - w/2<= s1.x + s1.w/2 && s1.x + s1.w/2 <= x+w/2)
          {
            if(y-h/2 <= s1.y - s1.h/2 && s1.y - s1.h/2 <= y+h/2)
            {
              
                print("top right");
                 x = (random(0, width));
                 y = (random(0, height));
                 hurt.play();
                 return true;
            }
          }
       
       */

     
     
     return false;
   }
    
    
    
  
  
  
  
  
}
