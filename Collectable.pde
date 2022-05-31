public class Collectable{
  
  
  float x, y;
  PImage image;
  boolean collision;
  
  public Collectable(float x, float y)
  
  
{
  this.image = loadImage("banana.png");
  this.x = x;
  this.y = y;
  this.collision = false;
  
}

public void display()
{
   
  //print(x, y);
  image(image, x, y);
  
  
  if(hitboxes){
  fill(0, 0, 0, 0);
  strokeWeight(2);
  stroke(0);

  ellipse(x, y, 15, 15);
  }
  

  
  
}


public void update()
{
       if((Math.sqrt(Math.pow((x - s1.x), 2) + Math.pow((y - s1.y), 2))) <= 15 + s1.w/2)

     {
       
       //print("hit");
       x = (random(0, width));
       y = (random(0, height));
       collision = true;
       collectSound.play();
       
       
     }
     else
   {
   collision = false;
   }
}
  
}
