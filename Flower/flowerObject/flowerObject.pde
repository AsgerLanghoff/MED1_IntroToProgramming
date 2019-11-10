Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;
Flower myFlower3;
Flower myFlower4;
Flower myFlower5;


void setup() {
  size(1600, 1200);

  int _r1= 60;
  int _petals=7;
  float _x=width/2;
  float _y=height/2;
  int _pc= int(random(#000000,#FFFFFF));
  int speedX=int(random(1, 10));
  int speedY=int(random(1, 10));

  myFlower1 = new Flower(_r1, _petals, random(0,width), random(0,height), _pc, random(-10,10),random(-10,10));
  myFlower2 = new Flower(_r1, _petals, random(0,width), random(0,height), _pc, random(-10,10),random(-10,10));
  myFlower3 = new Flower(_r1, _petals,random(0,width), random(0,height), _pc,random(-10,10),random(-10,10));
  myFlower4 = new Flower(_r1, _petals,random(0,width), random(0,height), _pc,random(-10,10),random(-10,10));
  myFlower5 = new Flower(_r1, _petals,random(0,width), random(0,height), _pc,random(-10,10),random(-10,10));
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
  myFlower4.display();
  myFlower4.move();
  myFlower4.bounce();
  myFlower5.display();
  myFlower5.move();
  myFlower5.bounce();
  //noLoop();
}
