Waste[] waste = new Waste[2];
Bath[] bath = new Bath[1];
Toy[] toy = new Toy[1];

void setup() {
  size(300, 300);
  background(255);
// Waste
  waste[0] = new Waste(20, 100, 40, 40, #81580D, #5F410A);
  waste[1] = new Waste(100, 100, 40, 40, #81580D, #5F410A);

// Bath
  bath[0] = new Bath(150, 30, 15, 15, #29A7D3, #29A7D3, #29A7D3);
  
// Toy
  toy[0] = new Toy(50, 30, 50, 50, #29A7D3, #0A4B50);
// Food

}

void draw() {
  background(255);
  // Boarder
  fill(#BBBEBF);
  rectMode(CORNER);
  rect(0,0,300,60);
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
}
