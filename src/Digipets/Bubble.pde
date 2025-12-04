class Bubble {
  float x, y, size, speed;

  Bubble(float x, float y) {
    this.x = x;
    this.y = y;
    this.size = random(5, 15);
    this.speed = random(0.5, 1);
  }

  void update() {
    y -= speed;
  }

  void display() {
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, size, size);
  }

  boolean isOffScreen(float limitY) {
    return y < limitY;
  }
}
