Pet pet1;
  // runs at the start of the program
  void setup() {
    
    // size of the screen
    size(600, 400);
    
    // setup colors
    color c1 = color(255, 255, 255);
    color c2 = color(255, 255, 255);
    color c3 = color(255, 255, 255);
    
    // load image from sketch data
    PImage p1 = loadImage("Pets.png");
    
    pet1 = new Pet(50, -40, 450, 550, 1, c1, c2, c3, p1);
    pet1.display();
  }
  // loops over and over
  void draw() {
    
    // reset background
    background(255);
   
    // display pet
    pet1.display();
  }
  
  
class Pet {
  
  // Member Variables
  int x, y, w, h, mood;
  color c1, c2, c3;
  PImage p1;
  
  // Constructer
  Pet(int x, int y, int w, int h, int mood, color c1, color c2, color c3, PImage p1) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.mood = mood;
    this.c1 = c1;
    this.c2 = c2;
    this.c3 = c3;
    this.p1 = p1;
  }
  void display() {
    image(p1, x, y, w, h);
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
  
