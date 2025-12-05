class Pet {

  // Member Variables
  int x, y, w, h, mood, sleepTime = second(), cleanTime = second(), foodTime = second(), moodTime = second();
  color c1, c2, c3;
  boolean over;
  PImage p1, gsleep, gclean, gfood, gmood;
  PImage p2;
  boolean tempPetState = false;

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
    gsleep = loadImage("GSleepMoodGUI.png");
    gsleep.resize(30, 30);
    gclean = loadImage("GCleanMoodGUI.png");
    gclean.resize(30, 30);
    gfood = loadImage("GFoodMoodGUI.png");
    gfood.resize(30, 30);
    gmood = loadImage("GMoodMoodGUI.png");
    gmood.resize(30, 30);
    p2 = loadImage("dog (1).png")
    p2.resize(60, 90);    
over = false;
  }
  void display() {
    image(p1, x, y);
    image(gsleep, x-65, y-90);
    image(gclean, x-25, y-90);
    image(gfood, x+15, y-90);
    image(gmood, x+55, y-90)
  }
  void mood () {
    if (sleepTime >= 60 && sleepTime < 120) {
      gsleep = loadImage("YSleepMoodGUI.png");
    } else if (sleepTime >= 120 && sleepTime < 180) {
      gsleep = loadImage("OSleepMoodGUI.png");
    } else if (sleepTime >= 180 && sleepTime < 240) {
      gsleep = loadImage("RSleepMoodGUI.png");
    }
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
