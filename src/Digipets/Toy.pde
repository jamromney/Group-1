class Toy {
  // Member Variables
  int x, y, w, h, speed, speedY;
  color r,g,b;
  boolean over;

  // Constructor
  Toy(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 2;
    speedY = 2;
    w = 50;
    h = 50;
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
  }

  void display() {
    fill(r,g,b);
    stroke(100);
    ellipse(x, y, w, h);
    if (mousePressed && mouseX >= x-30 && mouseX <= x+30 && mouseY >= y-30 && mouseY <= y+30) {
      x = mouseX;
      y = mouseY;
    }
  }

  // Member Methods
  void bounce() {
    x+=speed;
    y+=speedY;
    if (x>=500 || x<=0) {
      speed*=-1;
      r = int(random(0, 255));
      g = int(random(0, 255));
      b = int(random(0, 255));
    }
    if (y>=500 || y<=0) {
      speedY*=-1;
      r = int(random(0, 255));
      g = int(random(0, 255));
      b = int(random(0, 255));
    }
  }
}
