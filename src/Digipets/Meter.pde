// Jake Romney
class Meter {
  // Member Var
  int mood, eat, clean;
  char meterType; // h = happy, e = hunger, c = clean, m = mood
  PImage happyI, middleM, sad, hungry, middleH, full, cleanI, middleC, dirty;
  
  // Constructor
  Meter(char meterType){
    this.meterType = meterType;
    
    happyI = loadImage("GMoodMoodGUI.png");
    happyI.resize(80,80);
    middleM = loadImage("OMoodMoodGUI.png");
    middleM.resize(80,80);
    sad = loadImage("RMoodMoodGUI.png");
    sad.resize(80,80);
    
    full = loadImage("GFoodMoodGUI.png");
    full.resize(80,80);
    middleH = loadImage("OFoodMoodGUI.png");
    middleH.resize(80,80);
    hungry = loadImage("RFoodMoodGUI.png");
    hungry.resize(80,80);
    
    cleanI = loadImage("GCleanMoodGUI.png");
    cleanI.resize(80,80);
    middleC = loadImage("OCleanMoodGUI.png");
    middleC.resize(80,80);
    dirty = loadImage("RCleanMoodGUI.png");
    dirty.resize(80,80);
    
    mood = 4;
    eat = 4;
    clean = 4;
  }
  // Member Methods
  void display() {
    //================
    // Happyness Meter
    //================
    if (meterType == 'h' && mood > 2) {
      // Display Image
      image(happyI, 340,50);
    } else if(meterType == 'h' && mood > 1) {
      // Display less happy image
      image(middleM, 340,50);
    } else if(meterType == 'h' && mood > 1) {
      // Display Image
      image(sad, 340, 50);
    }
    //================
    // Hunger Meter
    //================
    if(meterType == 'e' && eat > 3) {
      // Display Image
      image(full, 420, 50);
    } else if(meterType == 'e' && eat > 2) {
      // Display Image
      image(middleH, 420, 50);
    } else if(meterType == 'e' && eat > 1) {
      // Display Image
      image(hungry, 420, 50);
    }
    //================
    // Clean
    //================
    if(meterType == 'c' && clean > 3) {
      // Display Image
      image(cleanI, 500,50);
    } else if(meterType == 'c' && clean > 2) {
      // Display Image
      image(middleC, 500,50);
    } else if(meterType == 'c' && clean > 1) {
      // Display Image
      image(dirty, 500,50);
    }
  }
}
