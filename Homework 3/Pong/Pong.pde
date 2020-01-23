
// definere variablerne
int playerCenterX = 50;
int playerWidth = 25;
int playerHeight = 200;
int score = 0;
int lives = 3;
int livesX = 40;
int livesY = 50;

int scoreX = 960;
int scoreY = 50;

int ballX = 960;
int ballY = 540;

int ballXStart = 960;
int ballYStart = 540;

int ballSpeedX = 10;
int ballSpeedY = 9;

int ballSize = 50;

int player_rightside = 75;

// definere vinduestørrelsen
void setup() {
  size(1920, 1080);
}

void draw() {
  //baggrund farve
  background(#000000);
  // objekt farve
  fill(#FFFFFF);
  // hvorfra rektanglen tegnes
  rectMode(CENTER);
  //spillerens placering og mål
  rect(playerCenterX, mouseY, playerWidth, playerHeight);
  //boldens placering og mål
  ellipse(ballX, ballY, ballSize, ballSize);
  //score
  textSize(40);
  text(score, scoreX, scoreY);
  // liv
  fill(#20C91E);
  text("Lives:", livesX, livesY);
  text(lives, 150, 50);

  // hvis bold rammer højre væg, hop tilbage med samme hastighed og giv 1 point
  ballX += ballSpeedX;
  if (ballX>width) {
    score++;
    ballSpeedX *= -1;
  }

  // hvis bold rammer gulv eller loft, hop tilbage med samme hastighed
  ballY += ballSpeedY;
  if (ballY>height || ballY<0) {
    ballSpeedY *= -1;
  }

  // hvis bold rammer spillerens højre side, hop tilbage med 1.5 gange hastighed.s
  if (ballX <= player_rightside && ballY < mouseY+playerHeight/2 && ballY > mouseY-playerHeight/2) {
    ballSpeedX *= -1.2;
  }
  // hvad der skal ske når man ikke rammer bolden.
  if (ballX < 0) {
    lives--;
    ballX =ballXStart;
    ballY=ballYStart;
    ballSpeedX = 10;
    ballSpeedY = 9;
    score = 0;
  }
  // deathscreen
  if (lives == 0) { 
    ballSpeedX = 0;
    ballSpeedY = 0;
    //textMode(CENTER);
    fill(#F20707);
    textSize(200);
    text("You died!", width/4, height/2);
  }
}
