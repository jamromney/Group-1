class Pet {

  // Member Variables
  int x, y, w, h, mood;
  color c1, c2, c3;
  PImage p1;

  // Constructer
  Pet(int x, int y, int w, int h, int mood, color c1, color c2, color c3) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.mood = mood;
    this.c1 = c1;
    this.c2 = c2;
    this.c3 = c3;
    p1 = loadImage("Pets.png");
    p1.resize(200, 200);
  }
  void display() {
    image(p1, x, y);
  }
  void move() {
  }
  void eat() {
  }
  void waste() {
  }
  void bathe() {
  }
}
