class Pet {

  // Member Variables
  int x, y, w, h, mood;
  color c1, c2, c3;
  boolean over;
  PImage p1,p2;

  // Constructer
  Pet(int x, int y, int mood, color c1, color c2, color c3) {
    this.x = x;
    this.y = y;
    w = 80;
    h = 130;
    this.mood = mood;
    this.c1 = c1;
    this.c2 = c2;
    this.c3 = c3;
    p1 = loadImage("Cat (2).png");
    p1.resize(266, 170);
p2 = loadImage("dog (1).png");
    p2.resize(60, 90);
    over = false; 
  }
  void display() {
    image(p1, x, y);
image(p2, x, y);  
}
  void eat() {
  }
  void waste() {
  }
  void bathe() {
  }
  boolean move(int tempX, int tempY) {
    if (x>tempX-w/2 && x<tempX+w/2 && y>tempY-h/2 && y<tempY+h/2 && mousePressed) {
      over = true;
      x = tempX;
      y = tempY;
      //if (mousePressed == true) {
        //x = mouseX;
        //y = mouseY;
        //over = true;
        //return true;
      //}
      return true;
    } else {
      over = false;
      return false;
    }
  }
}
