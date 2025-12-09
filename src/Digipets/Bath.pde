class Bath {
  int x, y, w, h;
  PImage bath;
  ArrayList<Bubble> bubbles;
  int waterOffsetX, waterOffsetY;

  Bath(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;

    bubbles = new ArrayList<Bubble>();

    bath = loadImage("BathGUI.png");
    bath.resize(220, 120);

    waterOffsetX = 10;  
    waterOffsetY = -30;  
  }

  void display() {
    image(bath, x, y);

    for (int i = bubbles.size()-1; i >= 0; i--) {
      Bubble b = bubbles.get(i);
      b.update();
      b.display();

      if (b.y < 0) {   // better removal rule
        bubbles.remove(i);
      }
    }
  }

  void makeBubbles() {
    if (frameCount % 10 == 0) {
      float bx = x + waterOffsetX + random(-20, 20);
      float by = y + waterOffsetY;
      bubbles.add(new Bubble(bx, by));
    }
  }

  boolean hover(int mx, int my) {
int padding = 10;         
  int shiftLeft = -10;      

  return mx > x + shiftLeft - padding &&
         mx < x + bath.width + shiftLeft + padding &&
         my > y - padding &&
         my < y + bath.height + padding;
  }
}

//class Bath {
//  int x, y, w, h;
//  boolean over;
//  PImage bath;
//  ArrayList<Bubble> bubbles;
//  int waterOffsetX, waterOffsetY;

//  Bath(int x, int y, int w, int h) {
//    this.x = x;
//    this.y = y;
//    this.w = w;
//    this.h = h;

//    bubbles = new ArrayList<Bubble>();

//    bath = loadImage("BathGUI.png");
//    bath.resize(220, 120);
//    waterOffsetX = 298 - x;
//    waterOffsetY = 180 - y;
//  }

//  void display() {
//    image(bath, x, y);

//    // draw bubbles
//    for (int i = bubbles.size()-1; i >= 0; i--) {
//      Bubble b = bubbles.get(i);
//      b.update();
//      b.display();

//      if (b.isOffScreen(y - 50)) {
//        bubbles.remove(i);
//      }
//    }
//  }

//  void makeBubbles() {
//    if (frameCount % 10 == 0) {
//      float bx = x + waterOffsetX + random(-20, 20); // horizontal wobble
//      float by = y + waterOffsetY;
//      //float bx = x + bath.width * 0.3 + random(bath.width * 0.4);
//      //float by = y + bath.height * 0.6;
//      bubbles.add(new Bubble(bx, by));
//    }
//  }

//  boolean hover(int mx, int my) {
//    return mx > x && mx < x + bath.width &&
//      my > y && my < y + bath.height;
//  }
//}
