// Jake Romney
class Waste {
  // Member Var
  int x, y, h, w;
  boolean over;
  int gx = 250;
  int gy = 30;
  boolean display = true;
  PImage waste;

  // constructor
  Waste(int x, int y) {
    this.x =x;
    this.y = y;
    w = 40;
    h = 40;
    over = false;

    waste = loadImage("waste.png");
    waste.resize(40, 40);
  }

  // Member Methods
  void display() {
    // Delete Waste
    //if (x + w/2 > gx && x - w/2 < gx && y + h/2 > gy && y - h/2 < gy) {
    //  display = false;
    //}
     //Display Waste
    if (display == true) {
      imageMode(CENTER);
      image(waste, x, y);
    }
  }

  boolean intersects() {
    return dist(x, y, 250, 50) < w-15;
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
