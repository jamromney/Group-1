class Bath {
  int x, y, w, h;
  color c1, c2, c3;
  boolean over;
  PImage bath;
  ArrayList<Bubble> bubbles;

  Bath(int x, int y, int w, int h, color c1, color c2, color c3) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    bubbles = new ArrayList<Bubble>();

    bath = loadImage("bath.png");
    bath.resize(200, 200);
  }

  void display() {
    image(bath, x, y);

    // draw bubbles
    for (int i = bubbles.size()-1; i >= 0; i--) {
      Bubble b = bubbles.get(i);
      b.update();
      b.display();

      if (b.isOffScreen(y)) {
        bubbles.remove(i);
      }
    }
  }

  void makeBubbles() {
    if (frameCount % 10 == 0) {
      float bx = x + bath.width * 0.3 + random(bath.width * 0.4);
      float by = y + bath.height * 0.6;
      bubbles.add(new Bubble(bx, by));
    }
  }

  boolean hover(int mx, int my) {
    return mx > x && mx < x + bath.width &&
      my > y && my < y + bath.height;
  }
}
