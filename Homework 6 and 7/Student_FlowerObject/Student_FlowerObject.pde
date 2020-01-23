Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;  // the second instance of the Flower class
Flower myFlower3;
Flower myFlower4;
Flower myFlower5;

// the 3 flowersizes
int _r1= 60;     
int _r2 = 100;
int _r3 = 120;
// amount of petals
int _petals=7;
// initial x and y placement
float _x=width/2;
float _y=height/2;
// color
int _pc=#FFA000;
int offset = 350;

// number of flowers in the tail
int num = 20;
// arrays for the tail flowers coordinates
int[] tailX = new int[num];
int[] tailY = new int[num];
// size of the largest tail flower
float size =60;

void setup() {
  size(1600, 900);//size of the application window


// establishing my flowers and their values
  myFlower1 = new Flower(_r1, _petals, _x, _y, _pc, random(-10, 10), random(-10, 10)); 
  myFlower2 = new Flower(_r2, _petals, _x, _y+offset, _pc, random(-10, 10), random(-10, 10));
  myFlower3 = new Flower(_r3, _petals, _x, _y, _pc, random(-10, 10), random(-10, 10));
  myFlower4 = new Flower(_r2, _petals, _x, _y, _pc, random(-10, 10), random(-10, 10));
  myFlower5 = new Flower(_r1, _petals, mouseX, mouseY, _pc, 0, 0);
}

void draw() {
  background(#43AF76); // the background color.

  /*myFlower1.overlap(myFlower2);
  myFlower1.overlap(myFlower3);
  myFlower1.overlap(myFlower4);
  myFlower1.overlap(myFlower5);
  myFlower2.overlap(myFlower1);
  myFlower2.overlap(myFlower3);
  myFlower2.overlap(myFlower4);
  myFlower2.overlap(myFlower5);
  myFlower3.overlap(myFlower1);
  myFlower3.overlap(myFlower2);
  myFlower3.overlap(myFlower4);
  myFlower3.overlap(myFlower5);
  myFlower4.overlap(myFlower1);
  myFlower4.overlap(myFlower2);
  myFlower4.overlap(myFlower3);
  */
  myFlower5.overlap(myFlower4);
  myFlower5.overlap(myFlower1);
  myFlower5.overlap(myFlower2);
  myFlower5.overlap(myFlower3);
  
  for (int i =num-1; i > 0; i--) {
    tailX[i] = tailX[i-1];
    tailY[i] = tailY[i-1];
  }
  tailX[0] =mouseX;
  tailY[0] =mouseY;
  for (int i = 0; i < num; i++) myFlower5.displayTail(tailX[i], tailY[i], size/i, size/i);

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
  myFlower5.follow();

}
