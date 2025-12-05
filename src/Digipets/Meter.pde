// Jake Romney
class Meter {
  // Member Var
  int mood, eat, clean;
  char meterType; // h = happy, e = hunger, c = clean, m = mood
  PImage happyI, middleM, sad, hungry, middleH, full, cleanI, middleC, dirty;

  // Constructor
  Meter(char meterType) {
    this.meterType = meterType;

    happyI = loadImage("GMoodMoodGUI.png");
    happyI.resize(80, 80);
    middleM = loadImage("OMoodMoodGUI.png");
    middleM.resize(80, 80);
    sad = loadImage("RMoodMoodGUI.png");
    sad.resize(80, 80);

    full = loadImage("GFoodMoodGUI.png");
    full.resize(80, 80);
    middleH = loadImage("OFoodMoodGUI.png");
    middleH.resize(80, 80);
    hungry = loadImage("RFoodMoodGUI.png");
    hungry.resize(80, 80);

    cleanI = loadImage("GCleanMoodGUI.png");
    cleanI.resize(80, 80);
    middleC = loadImage("OCleanMoodGUI.png");
    middleC.resize(80, 80);
    dirty = loadImage("RCleanMoodGUI.png");
    dirty.resize(80, 80);

    mood = 1;
    eat = 1;
    clean = 1;
  }
  // Member Methods
  void display() {
    //================
    // Happiness Meter
    //================
    if (meterType == 'h') {
      if (mood >= 4) {
        image(happyI, 340, 50);
      } else if (mood >= 2) {
        image(middleM, 340, 50);
      } else {
        image(sad, 340, 50);
      }
    }

    //================
    // Hunger Meter
    //================
    if (meterType == 'e') {
      if (eat >= 4) {
        image(full, 420, 50);
      } else if (eat >= 2) {
        image(middleH, 420, 50);
      } else {
        image(hungry, 420, 50);
      }
    }

    //================
    // Clean Meter
    //================
    if (meterType == 'c') {
      if (clean >= 4) {
        image(cleanI, 500, 50);
      } else if (clean >= 2) {
        image(middleC, 500, 50);
      } else {
        image(dirty, 500, 50);
      }
    }
  }
  void cleanChange() {
    if (waste.size() >= 3) {
      clean = 1;
      println("Too much waste");
    } else if (pet1.x < bath.x + bath.w &&pet1.x + pet1.w > bath.x &&pet1.y < bath.y + bath.h &&pet1.y + pet1.h > bath.y) {
      clean += 1;
      println("Cleaning");
      println(clean);
    }
  }

  void moodChange() {
    if (clean >= 4 && eat >= 4) {
      mood = 4;  // very happy
    } else if (clean >= 2 && eat >= 2) {
      mood = 2;  // okay
    } else {
      mood = 1;  // unhappy
    }
  }

  void eatChange() {
    if (pet1.x < food.x + food.bowl.width &&pet1.x + pet1.w > food.x &&pet1.y < food.y + food.bowl.height &&pet1.y + pet1.h > food.y) {
      eat += 1;
      println("eat increasing");
      println(eat);
    }
  }
}
