


public class Enemy{
  
  
  float y, x, size, speed, angle, yIncrease, xIncrease;
  PImage image;
  

  public Enemy(String filename, float x, float y, float size, float angle, float speed){
    
    image = loadImage(filename);
    this.size = size;
    this.speed = speed;
    this.angle =  angle * (float)(Math.PI/180);
    this.y = y;
    this.x = x;
    
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
    xIncrease = (speed*(float)Math.sin(angle))/(float)Math.sin(Math.PI/2);
    yIncrease = (speed*(float)Math.sin(Math.PI - angle + Math.PI/2))/(float)Math.sin(Math.PI/2);
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
     
     if((Math.sqrt(Math.pow((x - s1.x), 2) + Math.pow((y - s1.y), 2))) <= 14+ (s1.w))

     {
       
       //print("hit");
       hurt.play();
       return true;
     }
     return false;
   }
    
    
    
  
  
  
  
  
}
