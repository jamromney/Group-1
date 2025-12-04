// ============================================================
// GLOBALS
// ============================================================

// Waste system
ArrayList<Waste> waste = new ArrayList<Waste>();
Waste selectedWaste = null;

// Optional future Dragable system
ArrayList<Dragable> dragables = new ArrayList<Dragable>();
int createDragable() {
  Dragable d = new Dragable();
  dragables.add(d);
  return dragables.size() - 1;
}

// Game Objects
Bath bath;
Toy toy;
Pet pet1;
Meter mood;  // <-- METER ADDED HERE

// Screens
char screen = 's';   // s = Start, p = Play, e = End, m = Menu, g = Game Over

// Buttons
Button btnStart, btnEnd, btnPause, btnRestart, btnMenu, btnGameOver;

// Timer
int interval = 60000;
int lastTime = 0;

// Graphics
PImage can, gameBackground;
PFont helv;


// ============================================================
// SETUP
// ============================================================
void setup() {
  size(600, 600);
  frameRate(60);

  helv = createFont("Helvetica-Bold", 90);

  // Images
  can = loadImage("garbageCan.png");
  can.resize(80, 80);

  gameBackground = loadImage("MainGameBGGUI.png");
  gameBackground.resize(600, 600);

  // Game Objects
  bath = new Bath(150, 30, 15, 15, #29A7D3, #29A7D3, #29A7D3);
  toy = new Toy(50, 30);
  pet1 = new Pet(300, 300, 1, color(255), color(255), color(255));

  // Meter added
  mood = new Meter('h');

  // Buttons
  btnStart     = new Button("Play!",    230, 280, 160, 50);
  btnPause     = new Button("Pause",     40, 540, 160, 50);
  btnEnd       = new Button("End",       40, 540, 160, 50);
  btnRestart   = new Button("Resume",   250, 540, 160, 50);
  btnMenu      = new Button("Menu",     120, 340, 160, 50);
  btnGameOver  = new Button("Game Over", 320, 540, 160, 50);

  lastTime = millis();
}


// ============================================================
// MAIN DRAW LOOP
// ============================================================
void draw() {
  background(gameBackground);

  switch (screen) {
    case 's': drawStart(); break;
    case 'p': drawPlay();  break;
    case 'e': drawEnd();   break;
    case 'm': drawMenu();  break;
    case 'g': drawGameOver(); break;
  }
}


// ============================================================
// SCREENS
// ============================================================

void drawStart() {
  background(100, 100, 255);
  textFont(helv);
  fill(230);
  textAlign(CENTER);
  textSize(80);
  text("Digipets", width/2, 180);

  btnStart.display();
  btnMenu.display();
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

void drawGameOver() {
  fill(0, 50, 0);
  rect(0, 0, 600, 600);

  fill(0, 100, 0);
  ellipse(width/2, height/2, 600, 500);
  fill(0, 150, 0);
  ellipse(width/2, height/2, 400, 300);

  fill(0);
  textSize(87);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2 - 30);
  text(":(", width/2, height * 3/4 - 30);

  fill(255, 255, 0);
  text("GAME OVER", width/2 + 3, height/2 - 28);
  text(":(", width/2 + 3, height * 3/4 - 28);

  btnRestart.display();
}


// ============================================================
// GAMEPLAY SCREEN
// ============================================================
void drawPlay() {

  // Bottom bar
  fill(#627FD3);
  rect(0, 520, width, height);

  // Timer → spawn waste every 60 sec
  if (millis() - lastTime > interval) {
    waste.add(new Waste(pet1.x - 50, pet1.y + 20));
    lastTime = millis();
  }

  // Waste dragging + display
  for (int i = waste.size() - 1; i >= 0; i--) {
    Waste w = waste.get(i);

    if (mousePressed && w == selectedWaste) {
      w.x = mouseX;
      w.y = mouseY;
    }

    w.display();

    // Remove if dropped on trash can
    if (w.intersects()) {
      waste.remove(i);
    }
  }

  // Trash can
  imageMode(CENTER);
  image(can, 250, 50);

  // Bath + bubble logic restored
  bath.display();
  if (bath.hover(mouseX, mouseY)) {
    bath.makeBubbles();
  }

  // Toy
  toy.display();

  // Meter added
  mood.display();

  // Pet
  pet1.display();
  pet1.move(mouseX, mouseY);

  // Buttons
  btnPause.display();
  btnGameOver.display();
}


// ============================================================
// INPUT HANDLING
// ============================================================
void mousePressed() {

  // Select waste item
  for (int i = waste.size() - 1; i >= 0; i--) {
    if (waste.get(i).hover(mouseX, mouseY)) {
      selectedWaste = waste.get(i);
      break;
    }
  }

  // Button logic
  switch (screen) {

    case 's':
      if (btnStart.clicked()) screen = 'p';
      else if (btnMenu.clicked()) screen = 'm';
      break;

    case 'p':
      if (btnEnd.clicked()) screen = 'e';
      if (btnGameOver.clicked()) screen = 'g';
      break;

    case 'e':
      if (btnEnd.clicked()) screen = 's';
      else if (btnRestart.clicked()) screen = 'p';
      break;

    case 'm':
      if (btnMenu.clicked()) screen = 's';
      else if (btnRestart.clicked()) screen = 'p';
      break;

    case 'g':
      if (btnRestart.clicked()) screen = 'p';
      break;
  }
}

void mouseReleased() {
  selectedWaste = null;
}

void mouseClicked() {
  for (Dragable d : dragables) {
    if (d.mouseOver()) {
      d.dragged = true;
    }
  }
}
