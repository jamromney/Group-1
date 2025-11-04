class Waste {
  // Member Var
  int x, y, h, w;
  color c1, c2;
  boolean over;
  
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
    if (over == true) {
      fill(c1);
    } else {
      fill(c2);
    }
    rectMode(CENTER);
    rect(x ,y ,w, h);
  }
  
  boolean hover(int tempX, int tempY) {
    if (x>tempX-w/2 && x<tempX+w/2 && y>tempY-h/2 && y<tempY+h/2) {
      over = true;
      return true;
    } else {
      over = false;
      return false;
    }
  }
  
  void move() {}
}
