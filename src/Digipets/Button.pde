class Button {
  String label;
  float x, y, w, h;

  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

 if(label.equals("start")){
     b1 = loadImage("StartButtonGUI.png");
    } else if(label.equals("pause")){
     b1 = loadImage("PauseButtonGUI.png");
    } else if(label.equals("end")){
     b1 = loadImage("EndButtonGUI.png");
    } else if(label.equals("resume")){
     b1 = loadImage("ResumeButtonGUI.png");
    } else if(label.equals("settings")){
     b1 = loadImage("SettingsButtonGUI.png");
    } else if(label.equals("gameOver")){
     b1 = loadImage("GameOverButtonGUI.png");
    }
  }

  void display() {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
      fill(#797878);
    } else {
      fill(255);
    }
    stroke(0);
    rect(x, y, w, h, 10);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(label, x + w/2, y + h/2);
  }

  boolean clicked() {
    return (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  }
}

