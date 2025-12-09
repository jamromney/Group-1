class Food {
  // Member Vars
  int x,y;
  PImage bowl;
  // Constructor
  Food(int x, int y){
    this.x = x;
    this.y = y;
    bowl = loadImage("BowlFullGUI.png");
    bowl.resize(65,40);
  }
  // Member Methods
  void display() {
    fill(100,100,100);
    image(bowl, 200,250);
  }
}

