  //Claire Danzig
class Toy {
  // Member Variables
  int x, y, w, h, speed, speedY;
  color r, g, b;
  boolean over;
  PImage catToy;
  PImage dogToy;
  
  boolean tempPetState = true; //false = cat, true = dog

  // Constructor
  Toy(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 3;
    speedY = 2;
    w = 50;
    h = 200;
    r = int(random(128, 255));
    g = int(random(128, 255));
    b = int(random(128, 255));
    
    catToy = loadImage("Toy1GUI.png");
    dogToy = loadImage("Toy2GUI.png");
  }

  void display() {
    //fill(r, g, b);
    //ellipse(x, y, w, h);
    
    //PUT IMAGE CODE HERE
    if (tempPetState) image(dogToy,x,y);
    if (!tempPetState) image(catToy,x,y);
    
    
    strokeWeight(6);
    if (mousePressed && mouseX >= x-30 && mouseX <= x+30 && mouseY >= y-30 && mouseY <= y+30) {
      x = mouseX;
      y = mouseY;

      if (mouseX >= 475) {
        x = 475;
      } else if (mouseX <= 25) {
        x = 25;
      }

      if (mouseY >= 475) {
        y = 475;
      } else if (mouseY <= 25) {
        y = 25;
      }
    }
  }

  // Member Methods
  void bounce() {
    x+=speed;
    y+=speedY;
    if (x>=475 || x<=25) {
      speed*=-1;
      r = int(random(0, 255));
      g = int(random(0, 255));
      b = int(random(0, 255));
    }
    if (y>=475 || y<=25) {
      speedY*=-1;
      r = int(random(0, 255));
      g = int(random(0, 255));
      b = int(random(0, 255));
    }
  }
}
