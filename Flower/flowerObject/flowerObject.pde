Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;
Flower myFlower3;

void setup() {
  size(1600, 900);

  int _r1= 60;
  int _petals=7;
  int _pc=#FFA000;

  myFlower1 = new Flower(_r1, _petals, random(0, width), random(0, height), _pc, random(-10, 10), random(-10, 10));
  myFlower2 = new Flower(_r1, _petals, random(0, width), random(0, height), _pc, random(-10, 10), random(-10, 10));
  myFlower3 = new Flower(_r1, _petals, random(0, width), random(0, height), _pc, random(-10, 10), random(-10, 10));
}

void draw() {
  background(#43AF76);

  myFlower1.display();
  myFlower1.move();
  myFlower1.bounce();

  myFlower2.display();
  myFlower2.move();
  myFlower2.bounce();

  myFlower3.display();
  myFlower3.move();
  myFlower3.bounce();

  //noLoop();
}
