public class Button{
  
  
  float y, x, w, h;
  boolean hovered, clicked;
  String ButtonText;
  int r, g, b;
  
  public Button(String ButtonText, float x, float y, float w, float h, int r, int g, int b){
  
      this.ButtonText = ButtonText;
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.r = r;
      this.g = g;
      this.b = b;
      this.hovered = false;
      this.clicked = false;
      
  }
  public void display()
  {
     stroke(2);
     print(clicked, hovered);
     if(this.clicked){fill(r/2, g/2, b/2);}
     else if(this.hovered){fill(r/1.5, g/1.5, b/1.5);}
     else{
     fill(r, g, b);
     }
     pushMatrix();
     translate(x, y);
     rect(0 - w/2, 0-w/2, w, h);
     
     
     fill(255, 255, 255);
     text(ButtonText, x, y);
     
     
     popMatrix();
  }
  
  public void update()
  {
    
    println(x, y, w, h, mouseX, mouseY);
    
    if(x - w/2<= mouseX && mouseX <= x+w/2)
    {
      if(y-h/2 <= mouseY && mouseY <= y+h/2)
      {
        println("hovered");
        this.hovered = true;
        if(mousePressed)
        {
          println("clicked");
          this.clicked = true;
        }
        else{
        clicked = false;
        }
      }
    }
    this.hovered = false;
    this.clicked = false;
  }
  









}
