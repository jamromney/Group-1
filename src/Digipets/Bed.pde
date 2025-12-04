class Zzz {
  float x, y;
  float baseX;   // original x position
  float speed;
  float size;
  float angle;
  float amplitude;
  float alpha;


  Zzz(float x, float y) {
    this.x = x;
    this.baseX = x;
    this.y = y;
    this.speed = random(0.5, 1);
    this.size = random(10, 25);
    this.angle = random(TWO_PI);
    this.amplitude = random(3, 10);  // max wobble in pixels
    alpha = 255;

  }


  void update() {
    y -= speed;
    angle += 0.05;
    x = baseX + sin(angle) * amplitude;  // wobble left/right
    alpha -= 1;
  }

  void display() {
    textAlign(CENTER);
    fill(255);
    textSize(size);
    text("Z", x, y);
  }

  boolean isOffScreen(float limitY) {
    return y < limitY - 20 || alpha <= 0;
  }
}
