// Jake Romney
class Waste {
  // Member Var
  int x, y, h, w;
  color c1, c2;
  boolean over;
  int gx = 250;
  int gy = 30;
  boolean display = true;
  PImage can, waste;
  
  

  // constructor
  Waste(int x, int y, int w, int h, color c1, color c2) {
    this.x =x;
    this.y = y;
    this.w =w;
    this.h = h;
    this.c1 = c1;
    this.c2 = c2;
    over = false;
    
    can = loadImage("garbageCan.png");
    can.resize(80,80);
    waste = loadImage("waste.png");
    waste.resize(40,40);
  }

  // Member Methods
  void display() {
    // Trash Can
    imageMode(CENTER);
    image(can, gx, gy);
    // Waste
    if (over == true) {
      fill(c1);
    } else {
      fill(c2);
    }
    // Delete Waste
    if (x + w/2 > gx && x - w/2 < gx + 80 && y + h/2 > gy && y - h/2 < gy + 80) {
      display = false;
    }
    // Display Waste
    if (display == true) {
      imageMode(CENTER);
      image(waste, x, y);
    }
  }

  boolean hover(int tempX, int tempY) {
    if (x>tempX-w/2 && x<tempX+w/2 && y>tempY-h/2 && y<tempY+h/2) {
      over = true;
      if (mousePressed == true) {
        x = mouseX;
        y = mouseY;
        over = true;
        return true;
      }
      return true;
    } else {
      over = false;
      return false;
    }
  }
}
