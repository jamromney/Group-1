public class Dragable {  
  int x,y;
  int w,h;
  boolean dragged = false;
  boolean active = true;
  
  Dragable () {this(0,0,0,0);}; //default constructor
  Dragable (int x, int y, int w, int h) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
  }
  
  boolean mouseOver () { //returns true if mouse is hovering over dragable
    if (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2) return true;
    return false;
  }
}
