/* DO NOT MODIFY THIS FILE */

public class Sprite{
  PImage image;
  float x, y;
  float change_x, change_y;
  float w, h; 
  float size;
  public Sprite(String filename, float scale, float X, float Y){
    image = loadImage(filename);
    w = image.width * scale;
    h = image.height * scale;
    this.size = scale;
    x = X;
    y = Y;
    change_x = 0;
    change_y = 0;
  }
  public Sprite(String filename, float scale){
    this(filename, scale, 0, 0);
  }
  
  public void display(){
    fill(255, 100, 255);
    
 
    image(image, x, y, w, h);

    
    //println(w, h);
  }
  public void update(){
    x += change_x;
    y += change_y;
  }
}
