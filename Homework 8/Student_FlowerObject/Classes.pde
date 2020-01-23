class Flower {

  // Variables
  float speedX; //Der blev lavet en speed variable så man kunne flytte på blomsten og sætte den til forskellig hastighed
  float ballX;
  float ballY;
  float speedY;

  /*int num = 40;
   int[] tailX = new int[num];
   int[] tailY = new int[num];
   float size =1;
   */


  float r;       // radius of the flower petal
  int n_petals;  // number of petals 
  float x;       // x-position of the center of the flower
  float y;       // y-position of the center of the flower
  int petalColor;//hexadecimal number for the color of petals
  int transparency =150;

  Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor, float temp_speedX, float temp_speedY) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    speedX = temp_speedX;
    speedY = temp_speedY;
  }

  void overlap(Flower other) {
    float d= dist(x, y, other.x, other.y);
    if (d < r + other.r) {
      background (255);
    }
  }

  void follow () {
    x = mouseX;
    y = mouseY;
  }

  void display () {


    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }

  void displayTail (float tailX, float tailY, float tailR, float TailR) {


    fill(petalColor, transparency);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      ballX=tailX + tailR*cos(i);
      ballY=tailY + tailR*sin(i);
      ellipse(ballX, ballY, tailR, tailR );
    }
    fill(200, 0, 0, 150);
    ellipse(tailX, tailY, tailR*1.2, TailR*1.2);
  }
  void move() {

    x = x + speedX;
    y = y + speedY;
  }
  void bounce() {
    if (x > width-r || x < 0) {
      speedX = speedX * (-1);
    }
    if ( y > height-r || y < 0) {
      speedY = speedY * (-1);
    }
  }
  void coloring() {
    if (x > width-r || x < r || y > height || y < 0) {
      fill(0, 0, 255);
      ellipse(x, y, r*1.2, r*1.2);
    }
  }
}
class ball {

  int x;
  int y;
  int r;
  float xSpeed;
  float ySpeed;
  int ballColor;

  ball(int temp_r, int temp_x, int temp_y, int temp_ballColor, float temp_xSpeed, float temp_ySpeed) {
    r=temp_r;
    x=temp_x;
    y=temp_y;
    ballColor=temp_ballColor;
    xSpeed=temp_xSpeed;
    ySpeed=temp_ySpeed;
  }
  void display() {

    fill(ballColor);
    ellipseMode(RADIUS);
    ellipse(ballX, ballY, r, r);
  }
  void move() {

    ballX+=xSpeed;
    ballY+=ySpeed;
  }
  void bounce() {
    if (ballX>width-r) {
      xSpeed *= -1;
    }
    if (ballX<0+r) {
      xSpeed *= -1;
    }
    if (ballY<0+r) {
      ySpeed *= -1;
    }
    if (ballY>height-r) {
      ySpeed *= -1;
    }
  }
}
