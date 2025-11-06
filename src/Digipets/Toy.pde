class Toy {
  // Member Variables
  int x, y, w, h;
  color c1, c2;
  boolean over;
  
  // Constructor
  Toy(int x, int y, int w, int h, color c1, color c2) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    this.c2 = c2;
  }

  void display() {
    if (over) {
      fill(c2);
    } else {
      fill(c1);
    }
    stroke(100);
    ellipse(x, y, w, h);
  }
  
  // Member Methods
  
  void hover() {
    if (mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2) {
      over = true;
    } else {
      over = false;
    }
  }
}
