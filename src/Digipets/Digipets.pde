// Classes
ArrayList<Waste> waste = new ArrayList<Waste>();
Bath[] bath = new Bath[1];
Toy[] toy = new Toy[1];
Pet pet1;
Food food1;

char screen = 's'; // s = Start Menu, p = main play screen, e = end screen

// Buttons
Button btnStart, btnEnd, btnPause, btnRestart, btnMenu;

// Timer Settings
int interval = 60000; // 1 minutes in ms
int lastTime = 0;

// Trash Can
PImage can;

// Font
PFont helv;


void setup() {
  size(600, 600);
  background(255);
  helv = createFont("Helvetica-Bold", 90);

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
  pet1 = new Pet(300, 300, 1, c1, c2, c3);

  // Food
  food1 = new Food(100, 40);

  // Buttons
  btnStart = new Button("Play!", 230, 280, 160, 50);
  btnPause = new Button("Pause", 40, 540, 160, 50);
  btnEnd = new Button("End", 40, 540, 160, 50);
  btnRestart = new Button("Resume", 250, 540, 160, 50);
  btnMenu = new Button("Menu", 120, 340, 160, 50);
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
  case 'e':
    drawEnd();
    break;
  case 'm':
    drawMenu();
    break;
  }
}

void drawStart() {
  background(100, 100, 255);
  btnStart.display();
  fill(230);
  textSize(80);
  textFont(helv);
  text("Digipets", 310, 180);
}

void drawEnd() {
  background(100, 100, 255);
  btnEnd.display();
  btnRestart.display();
}

void drawMenu() {
  background(100, 100, 255);
  btnEnd.display();
  btnRestart.display();
}
void drawPlay() {
  // Background
  fill(#627FD3);
  rect(0, 520, width, height);

  // Timer
  if (millis() - lastTime >= interval) {
    println("Event triggered!");
    waste.add(new Waste(pet1.x - 50, pet1.y + 20));
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
  image(can, 250, 50);
  // bath class
  for (int i=0; i<bath.length; i++) {
    bath[i].display();
  }
  for (int i=0; i<toy.length; i++) {
    toy[i].display();
    toy[i].bounce();
  }
  pet1.display();
  pet1.move(mouseX, mouseY);
  food1.display();
  btnPause.display();
}

void mousePressed() {
  switch(screen) {
  case 'p':
    if (btnEnd.clicked()) {
      screen = 'e';
      break;
    }
    break;
  case 's':
    if (btnStart.clicked()) {
      screen = 'p';
      break;
    }
  case 'e':
    if (btnEnd.clicked()) {
      screen = 's';
      break;
    }
  case 'm':
    if (btnMenu.clicked()) {
      screen = 's';
      break;
    }
    if (btnRestart.clicked()) {
      screen = 'p';
      break;
    }
  }
}
