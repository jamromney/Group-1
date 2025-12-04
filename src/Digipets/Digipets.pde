// ============================================================
// GLOBALS
// ============================================================

// Waste system (original)
ArrayList<Waste> waste = new ArrayList<Waste>();
Waste selectedWaste = null;

// Optional Dragable system (future expansion)
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

// Screens
// s = Start, p = Play, e = End, m = Menu, g = Game Over
char screen = 's';

// Buttons
Button btnStart, btnEnd, btnPause, btnRestart, btnMenu, btnGameOver;

// Timer
int interval = 60000; // 60 seconds
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

  // Can
  can = loadImage("garbageCan.png");
  can.resize(80, 80);

  // Background
  gameBackground = loadImage("MainGameBGGUI.png");
  gameBackground.resize(600,600);

  // Game objects
  bath = new Bath(150, 30, 15, 15, #29A7D3, #29A7D3, #29A7D3);
  toy = new Toy(50, 30);

  pet1 = new Pet(300, 300, 1, color(255), color(255), color(255));

  // Buttons
  btnStart = new Button("Play!", 230, 280, 160, 50);
  btnPause = new Button("Pause", 40, 540, 160, 50);
  btnEnd = new Button("End", 40, 540, 160, 50);
  btnRestart = new Button("Resume", 250, 540, 160, 50);
  btnMenu = new Button("Menu", 120, 340, 160, 50);
  btnGameOver = new Button("Game Over", 320, 540, 160, 50);

  lastTime = millis();
}


// ============================================================
// MAIN DRAW LOOP
// ============================================================
void draw() {
  background(gameBackground);


  switch (screen) {
  case 's': drawStart(); break;
  case 'p': drawPlay(); break;
  case 'e': drawEnd(); break;
  case 'm': drawMenu(); break;
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
  strokeWeight(0);
  ellipse(width/2, height/2, 600, 500);
  fill(0, 150, 0);
  ellipse(width/2, height/2, 400, 300);

  fill(0);
  textSize(87);
  text("GAME OVER", width/2, height/2 - 30);
  text(":(", width/2, height*3/4 - 30);

  fill(255, 255, 0);
  text("GAME OVER", width/2 + 3, height/2 - 28);
  text(":(", width/2 + 3, height*3/4 - 28);
  btnRestart.display();
}


// ============================================================
// GAMEPLAY SCREEN
// ============================================================
void drawPlay() {

  // Bottom bar
  fill(#627FD3);
  rect(0, 520, width, height);

  // Timer → spawn waste
  if (millis() - lastTime > interval) {
    Waste w = new Waste(pet1.x - 50, pet1.y + 20);
    waste.add(w);
    lastTime = millis();
  }

  // Display waste + drag logic
  for (int i = waste.size() - 1; i >= 0; i--) {
    Waste w = waste.get(i);

    // Dragging
    if (mousePressed && w == selectedWaste) {
      w.x = mouseX;
      w.y = mouseY;
    }

    w.display();

    // Delete waste if touching trash can
    if (w.intersects()) {
      waste.remove(i);
    }
  }

  // Draw trash can
  imageMode(CENTER);
  image(can, 250, 50);

  // Game objects
  bath.makeBubbles();
  bath.display();
  toy.display();

  pet1.display();
  pet1.move(mouseX, mouseY);

  btnPause.display();
  btnGameOver.display();
}


// ============================================================
// INPUT HANDLING
// ============================================================
void mousePressed() {

  // Waste selection (topmost first)
  for (int i = waste.size() - 1; i >= 0; i--) {
    if (waste.get(i).hover(mouseX, mouseY)) {
      selectedWaste = waste.get(i);
      break;
    }
  }

  // Screen button handling
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
  // Does NOT affect Waste system yet
  // (kept for future Dragable support)
  for (Dragable d : dragables) {
    if (d.mouseOver()) {
      d.dragged = true;
    }
  }
}
