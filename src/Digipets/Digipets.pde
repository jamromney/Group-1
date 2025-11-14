// Classes
ArrayList<Waste> waste = new ArrayList<Waste>();
Bath[] bath = new Bath[1];
Toy[] toy = new Toy[1];
Pet pet1;

// Timer Settings
int interval = 10000;//120000;  // 2 minutes in ms
int lastTime = 0;

// Trash Can
PImage can;

void setup() {
  size(600, 600);
  background(255);
  // Grabage Can
  can = loadImage("garbageCan.png");
  can.resize(80, 80);
  println("can:", can);

  // Bath
  bath[0] = new Bath(150, 30, 15, 15, #29A7D3, #29A7D3, #29A7D3);

  // Toy
  toy[0] = new Toy(50, 30);
  // Food

  // Pet
  color c1 = color(255, 255, 255);
  color c2 = color(255, 255, 255);
  color c3 = color(255, 255, 255);

  // load image from sketch data

  pet1 = new Pet(300, 300, 450, 550, 1, c1, c2, c3);
  pet1.display();
}

void draw() {
  background(255);
  // Boarder
  fill(#BBBEBF);
  rectMode(CORNER);
  rect(0, 0, 600, 60);

  // Timer
  if (millis() - lastTime >= interval) {
    println("Event triggered!");
    waste.add(new Waste(50, 100));
    lastTime = millis(); // reset timer
  }

  // waste class
  for (int i = 0; i < waste.size(); i++) {
    Waste w = waste.get(i);
    if(w.hover(mouseX, mouseY)) {
      break;
    }
  }
  for (int i = 0; i < waste.size(); i++) {
    Waste w = waste.get(i);
    w.display();
  }
  // Garbage Can
  imageMode(CENTER);
  image(can, 250, 30);
  // bath class
  for (int i=0; i<bath.length; i++) {
    bath[i].display();
  }
  for (int i=0; i<toy.length; i++) {
    toy[i].display();
  }
  pet1.display();
}
