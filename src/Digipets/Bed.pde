class Bed {
  int x, y, w, h;
  boolean over;
  PImage bed;
  ArrayList<Zzz> zlist;

  Bed(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    zlist = new ArrayList<Zzz>();

    bed = loadImage("BedGUI.png");
    bed.resize(175, 105);
  }

  void display() {
    image(bed, 100, 200);

    // draw bubbles
    for (int i = zlist.size()-1; i >= 0; i--) {
      Zzz z = zlist.get(i);
      z.update();
      z.display();

      if (z.isOffScreen(y)) {
        zlist.remove(i);
      }
    }
  }

  void makeZzz() {
    if (frameCount % 30 == 0) {  // roughly 2 per second
      float zx = x + bed.width * 0.3 + random(bed.width * 0.4);
      float zy = y + bed.height * 0.3;
      zlist.add(new Zzz(zx, zy));
    }
  }

  boolean hover(int mx, int my) {
    return mx > x && mx < x + bed.width &&
      my > y && my < y + bed.height;
  }
}
