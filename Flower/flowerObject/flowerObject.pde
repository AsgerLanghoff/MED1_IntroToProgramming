Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;
Flower myFlower3;

void setup() {
  size(1600, 1200);

  int _r1= 60;
  int _petals=7;
  float _x=width/2;
  float _y=height/2;
  int _pc=#FFA000;
  int speedX=int(random(1, 10));
  int speedY=int(random(1, 10));

  myFlower1 = new Flower(_r1, _petals, _x, _y, _pc, speedX,speedY);
  myFlower2 = new Flower(_r1, _petals, _x+random(-100, 100), _y, _pc, speedX,speedY);
  myFlower3 = new Flower(_r1, _petals, _x+50, _y, _pc, speedX,speedY);
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
