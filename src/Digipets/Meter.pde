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
    sad = loadImage("RMoodMoodGUI.png");
    
    full = loadImage("GFoodMoodGUI.png");
    middleH = loadImage("OFoodMoodGUI.png");
    hungry = loadImage("RFoodMoodGUI.png");
    
    cleanI = loadImage("GCleanMoodGUI.png");
    middleC = loadImage("OCleanMoodGUI.png");
    dirty = loadImage("RCleanMoodGUI.png");
    
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
      image(happyI, 100,50);
    } else if(meterType == 'h' && mood > 1) {
      // Display less happy image
      image(middleM, 80,50);
    } else{
      // Display Image
      image(sad, 150, 50);
    }
    //================
    // Hunger Meter
    //================
    if(meterType == 'e' && eat > 3) {
      // Display Image
    } else if(meterType == 'e' && eat > 2) {
      // Display Image
    } else {
      // Display Image
    }
    //================
    // Clean
    //================
    if(meterType == 'c' && clean > 3) {
      // Display Image
    } else if(meterType == 'c' && clean > 3) {
      // Display Image
    } else{
      // Display Image
    }
  }
}
