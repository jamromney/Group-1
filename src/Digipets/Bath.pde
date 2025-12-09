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
