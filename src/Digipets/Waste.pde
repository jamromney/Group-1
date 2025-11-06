class Waste {
  // Member Var
  int x, y, h, w;
  color c1, c2;
  boolean over;
  int gx = 200;
  int gy = 10;
  boolean display = true;

  // constructor
  Waste(int x, int y, int w, int h, color c1, color c2) {
    this.x =x;
    this.y = y;
    this.w =w;
    this.h = h;
    this.c1 = c1;
    this.c2 = c2;
    over = false;
  }

  // Member Methods
  void display() {
    // Trash Can
    fill(0);
    rectMode(CORNER);
    rect(gx, gy, 80, 80);

    // Waste
    if (over == true) {
      fill(c1);
    } else {
      fill(c2);
    }
    rectMode(CENTER);
    if (x + w/2 > gx && x - w/2 < gx + 80 && y + h/2 > gy && y - h/2 < gy + 80) {
      display = false;
    }
    if (display == true) {
      rect(x, y, w, h);
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
