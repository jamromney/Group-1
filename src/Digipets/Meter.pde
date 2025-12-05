// Jake Romney
class Meter {
  // Member Var
  int mood, eat, clean, sleep;
  char meterType; // h = happy, e = hunger, c = clean, m = mood
  PImage happyI, middleM, sad, hungry, middleH, full, cleanI, middleC, dirty, sleepI, middleS, tired;

  // timer
  int eatTimer = 0;
  int cleanTimer = 0;
  int delayTime = 30000;
  int sleepTimer = 0;


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

    sleepI = loadImage("GSleepMoodGUI.png");
    sleepI.resize(80, 80);
    middleS = loadImage("OSleepMoodGUI.png");
    middleS.resize(80, 80);
    tired = loadImage("RSleepMoodGUI.png");
    tired.resize(80, 80);

    mood = 1;
    eat = 1;
    clean = 1;
    sleep = 1;
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
      if (eat >= 3) {
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
    //================
    // Sleep Meter
    //================
    if (meterType == 's') {
      if (sleep >= 3) {
        //image();
      } else if (sleep >= 2) {
        //image();
      } else {
        //image();
      }
    }
  }
  void cleanChange() {
    if (waste.size() >= 3) {
      clean = 1;
      println("Too much waste");
    } else if (pet1.x < bath.x + bath.w && pet1.x + pet1.w > bath.x &&
      pet1.y < bath.y + bath.h && pet1.y + pet1.h > bath.y) {

      if (cleanTimer == 0) {
        cleanTimer = millis(); // start the timer
        println(cleanTimer);
      }

      if (millis() - cleanTimer >= delayTime) {
        clean += 1;
        clean = constrain(clean, 0, 4);
        println("Cleaning: " + clean);
        cleanTimer = millis(); // reset timer
      }
    } else {
      cleanTimer = 0; // pet moved away, reset timer
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
      if (eatTimer == 0) {
        eatTimer = millis(); // start the timer
        println("Timer Started:", eatTimer);
      }
      if (millis() - eatTimer >= delayTime) {
        eat += 1;
        eat = constrain(eat, 0, 4);
        println("Eat increased: " + eat);
        eatTimer = millis(); // reset timer for next increment
      }
    } else {
      eatTimer = 0; // pet moved away, reset timer
    }
  }

  void sleepChange() {
    if (pet1.x < bed.x + bed.w && pet1.x + pet1.w > bed.x && pet1.y < bed.y + bed.h && pet1.y + pet1.h > bed.y) {

      if (sleepTimer == 0) 
      sleepTimer = millis();
      println("Timer Started:",sleepTimer);

      if (millis() - sleepTimer >= delayTime) {
        sleep = constrain(sleep + 1, 0, 3);
        println("Sleep increased: " + sleep);
        sleepTimer = millis();
      }
    } else {
      sleepTimer = 0; // pet moved away
    }
  }
}
