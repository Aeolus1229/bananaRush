public class Button{
  
  
  float y, x, w, h;
  boolean hovered, clicked;
  String ButtonText;
  int r, g, b;
  PFont font;
  int fontSize;
  char fontType;
  
  public Button(String ButtonText, float x, float y, float w, float h, int r, int g, int b, int fontSize, char fontType){
  
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
      
      if(fontType == 'b'){
      this.font = createFont("Arial-BoldMT", fontSize);
      }
      
  }
  public void display()
  {
     stroke(4);


    
     if(this.clicked){fill(r/2, g/2, b/2);}
     else if(this.hovered){fill(r/1.5, g/1.5, b/1.5);}
     else{
     fill(r, g, b);
     }
     pushMatrix();
     translate(x, y);
     rect(0 - w/2, 0-h/2, w, h);
     
     fill(255, 255, 255);
     
     textFont(font);
     textSize(24);
     
     textAlign(CENTER, CENTER);
     text(ButtonText, 0, 0);
     
     
     popMatrix();
  }
  
  public void update()
  {
    
    
    if(x - w/2<= mouseX && mouseX <= x+w/2)
    {
      if(y-h/2 <= mouseY && mouseY <= y+h/2)
      {

        hovered = true;
        
        if(mousePressed)
        {

          clicked = true;
        }
        else{
        clicked = false;
        }
      }
      else
    {
      clicked = false;
      hovered = false;
    }
    }
      else{
      clicked = false;
      hovered = false;
      }

  }
  









}
