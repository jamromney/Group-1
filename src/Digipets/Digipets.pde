Waste[] waste = new Waste[2];
Bath[] bath = new Bath[1];
Toy[] toy = new Toy[1];
Pet pet1;

void setup() {
  size(600, 600);
  background(255);
  // Waste
  waste[0] = new Waste(20, 100, 40, 40, #81580D, #5F410A);
  waste[1] = new Waste(100, 100, 40, 40, #81580D, #5F410A);

  // Bath
  bath[0] = new Bath(150, 30, 15, 15, #29A7D3, #29A7D3, #29A7D3);

  // Toy
  toy[0] = new Toy(50, 30, 50, 50, #29A7D3, #0A4B50);
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
  // waste class
  for (int i=0; i<waste.length; i++) {
    waste[i].display();
    waste[i].hover(mouseX, mouseY);
  }
  // bath class
  for (int i=0; i<bath.length; i++) {
    bath[i].display();
  }
  for (int i=0; i<toy.length; i++) {
    toy[i].display();
    toy[i].hover();
  }
  pet1.display();
}
