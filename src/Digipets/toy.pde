class Toy {
  // Member Variables
  float x, y, w, h;
  boolean onClick;


  //Constructor
  Toy(float x, float y) {
    this.x = x;
    this.y = y;
    w = 50;
    h = 50;
    onClick = false;
  }

  //Member Methods
  void display() {
    if (onClick == true) {
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(x, y, w, h);
    } else {
      fill(0, 255, 0);
      rectMode(CENTER);
      rect(x, y, w, h);
    }
  }

  boolean clicked(int tempX, int tempY) {
    if (x>tempX-w/2 && x<tempX+w/2 && y>tempY-h/2 && y<tempY+h/2 ) {
      onClick = true;
      return true;
    } else {
      onClick = false;
      return false;
    }
  }
}
