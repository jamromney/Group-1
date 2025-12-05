class Button {
  String label;
  float x, y, w, h;
  PImage b1, b2, b3, b4, b5, b6;

  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

 if(label.equals("start")){
     b1 = loadImage("StartButtonGUI.png");
     b1.resize(175,55);
    } else if(label.equals("pause")){
     b2 = loadImage("PauseButtonGUI.png");
     b2.resize(175,55);
    } else if(label.equals("end")){
     b3 = loadImage("EndButtonGUI.png");
     b3.resize(115,55);
    } else if(label.equals("resume")){
     b4 = loadImage("ResumeButtonGUI.png");
     b4.resize(200,55);
    } else if(label.equals("settings")){
     b5 = loadImage("SettingsButtonGUI.png");
     b5.resize(265,55);
    } else if(label.equals("gameOver")){
     b6 = loadImage("GameOverButtonGUI.png");
     b6.resize(285,55);
    }
  }

  void display() {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
      fill(#797878);
    } else {
      fill(255);
    }
    stroke(0); //Claire Danzig
    //rect(x, y, w, h, 10);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    //text(label, x + w/2, y + h/2);

    if(label.equals("start")){
     image(b1, x + w/2, y + h/2);
    } else if(label.equals("pause")){
     image(b2, x + w/2, y + h/2);
    } else if(label.equals("end")){
     image(b3, x + w/2, y + h/2);
    } else if(label.equals("resume")){
     image(b4, x + w/2, y + h/2);
    } else if(label.equals("settings")){
     image(b5, x + w/2, y + h/2);
    } else if(label.equals("gameOver")){
     image(b6, x + w/2, y + h/2);
    }
  }

  boolean clicked() {
    return (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  }
}




