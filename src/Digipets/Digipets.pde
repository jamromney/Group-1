// ============================================================
// GLOBALS
// ============================================================

// Waste system
ArrayList<Waste> waste = new ArrayList<Waste>();
Waste selectedWaste = null;

// Dragable system
ArrayList<Dragable> dragables = new ArrayList<Dragable>();
int createDragable() {
  Dragable d = new Dragable();
  dragables.add(d);
  return dragables.size() - 1;
}

// Game Objects
Bath[] bath = new Bath[1];
Toy[] toy = new Toy[1];
Pet pet1;

// Screens
char screen = 's';   // s = Start, p = Play, e = End, m = Menu, g = Game Over

// Buttons
Button btnStart, btnEnd, btnPause, btnRestart, btnMenu, btnGameOver;

// Timer
int interval = 60000; 
int lastTime = 0;

// Graphics
PImage can;
PFont helv;

void setup() {
  size(600, 600);
  frameRate(60);

  helv = createFont("Helvetica-Bold", 90);

  // Can
  can = loadImage("garbageCan.png");
  can.resize(80, 80);

  // Bath
  bath[0] = new Bath(230, 150, 500, 500, #29A7D3, #29A7D3, #29A7D3);

  // Toy
  toy[0] = new Toy(50, 30);

  // Pet
  pet1 = new Pet(300, 300, 1, color(255), color(255), color(255));

  // Buttons
  btnStart = new Button("Play!", 230, 280, 160, 50);
  btnPause = new Button("Pause", 40, 540, 160, 50);
  btnEnd = new Button("End", 40, 540, 160, 50);
  btnRestart = new Button("Resume", 250, 540, 160, 50);
  btnMenu = new Button("Menu", 120, 340, 160, 50);
  btnGameOver = new Button("Restart", 220, 430, 160, 50);

  lastTime = millis();
}
void draw() {
  background(255);

  switch (screen) {
  case 's': drawStart(); break;
  case 'p': drawPlay();  break;
  case 'e': drawEnd();   break;
  case 'm': drawMenu();  break;
  case 'g': drawGameOver(); break;
  }
}
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
void drawGameOver() {
  rectMode(CENTER);
  fill(0, 50, 0);
  rect(width/2, height/2, 600, 600);

  fill(0, 100, 0);
  ellipse(width/2, height/2, 600, 500);
  fill(0, 150, 0);
  ellipse(width/2, height/2, 400, 300);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(87);
  text("GAME OVER", width/2, height/2 - 30);
  text(":(", width/2, height*3/4 - 30);

  fill(255, 255, 0);
  text("GAME OVER", width/2 + 3, height/2);
  text(":(", width/2 + 3, height*3/4);

  btnGameOver.display();
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

  // Bottom bar
  fill(#627FD3);
  rect(0, 520, width, height);

  // Timer → spawn waste every 60s
  if (millis() - lastTime > interval) {
    waste.add(new Waste(pet1.x - 50, pet1.y + 20));
    lastTime = millis();
  }

  // Waste drag + draw
  for (int i = waste.size() - 1; i >= 0; i--) {
    Waste w = waste.get(i);

    // Dragging
    if (mousePressed && w == selectedWaste) {
      w.x = mouseX;
      w.y = mouseY;
    }

    w.display();

    // If touching trash can → delete
    if (w.intersects()) {
      waste.remove(i);
    }
  }

  // Draw trash can
  imageMode(CENTER);
  image(can, 250, 50);

  // Bath
  bath[0].display();
  if (bath[0].hover(mouseX, mouseY)) bath[0].makeBubbles();

  // Toy
  toy[0].display();
  toy[0].bounce();

  // Pet
  pet1.display();
  pet1.move(mouseX, mouseY);

  // Pause button
  btnPause.display();
}
void mousePressed() {

  // Waste selection (topmost first)
  for (int i = waste.size() - 1; i >= 0; i--) {
    if (waste.get(i).hover(mouseX, mouseY)) {
      selectedWaste = waste.get(i);
      break;
    }
  }

  // Screen button logic
  switch (screen) {

  case 's':
    if (btnStart.clicked()) screen = 'p';
    else if (btnMenu.clicked()) screen = 'm';
    break;

  case 'p':
    if (btnEnd.clicked()) screen = 'e';
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
    if (btnGameOver.clicked()) screen = 's';
    break;
  }
}

void mouseReleased() {
  selectedWaste = null;
}

void mouseClicked() {
  // Dragable support
  for (Dragable d : dragables) {
    if (d.mouseOver()) {
      d.dragged = true;
    }
  }
}
