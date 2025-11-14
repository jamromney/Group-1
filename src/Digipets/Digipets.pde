// Classes
ArrayList<Waste> waste = new ArrayList<Waste>();
Bath[] bath = new Bath[1];
Toy[] toy = new Toy[1];
Pet pet1;

char screen = 's'; // s = Start Menu, p = main play screen

// Buttons
Button btnStart, btnEnd;

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

  // Bath
  bath[0] = new Bath(150, 30, 15, 15, #29A7D3, #29A7D3, #29A7D3);

  // Toy
  toy[0] = new Toy(50, 30);
  // Food

  // Pet
  color c1 = color(255, 255, 255);
  color c2 = color(255, 255, 255);
  color c3 = color(255, 255, 255);
  pet1 = new Pet(300, 300, 450, 550, 1, c1, c2, c3);
  pet1.display();

  // Buttons
  btnStart = new Button("Start Game!", 280, 280, 160, 50);
  btnEnd = new Button("Pause", 40, 540, 160, 50);
}

void draw() {
  background(255);
  switch(screen) {
  case 's':
    drawStart();
    break;
  case 'p':
    drawPlay();
    break;
  }
}

void drawStart() {
  background(100, 100, 255);
  btnStart.display();
}

void drawPlay() {
  // Timer
  if (millis() - lastTime >= interval) {
    println("Event triggered!");
    waste.add(new Waste(50, 100));
    lastTime = millis(); // reset timer
  }

  // waste class
  for (int i = 0; i < waste.size(); i++) {
    Waste w = waste.get(i);
    if (w.hover(mouseX, mouseY)) {
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
    toy[i].bounce();
  }
  pet1.display();
  btnEnd.display();
}

void mousePressed() {
  switch(screen) {
  case 'p':
    if (btnEnd.clicked()) {
      screen = 's';
      break;
    }
    case 's':
      if (btnStart.clicked()) {
        screen = 'p';
        break;
      }
    }
  }
