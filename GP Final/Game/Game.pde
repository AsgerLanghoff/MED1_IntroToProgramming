
void setup() {
  
  // describe the size of the window
  size (1000, 500);
  
  // load all the different classes and files later used in the programme
  grid = new Bricks[bricks][brick_rows];
  myPlayer1 = new Player(p_middle, p_y, p_width, p_height, p_color, p_transparency);
  myBall1 =new ball(ballR, ballX, ballY, ball_color, xSpeed, ySpeed);
  myScore =new Scoreboard(score, scoreX, scoreY);
  sound1 =new SoundFile(this, "brickSound.wav");
  sound2 =new SoundFile(this, "playerSound.wav");
  sound3 =new SoundFile(this, "wallSound.wav");
  sound4 =new SoundFile(this, "lvlSound.wav");
  sound5 =new SoundFile(this, "deathSound.wav");
  
  // setting the corect boolean to true, to make the programme start in the right state 
  screen0 = true;
  gameScreen =false;
  lvlClear = false;
  
  // initializint the 2d array, and loading the coordinates of all the bricks
  for (int i = 0; i < bricks; i++) {
    for (int j = 0; j < brick_rows; j++) {
      grid[i][j] = new Bricks(i*brickSpacingX+offset, j*brickSpacingY, brick_width, brick_height);
    }
  }
}
void draw () {

  // defining what happens and is shown on screen 0
  if (screen0 == true) {
    background (backgroundColor);
    textSize(screen0TextSize);
    text(screen0Text, screen0TextX, screen0TextY);
    textSize(screen0TextSize2);
    text(screen0Text2, screen0TextX2, screen0TextY2);
    
    // telling the programme to change to the gamescreen after mouse is pressed
    if (mousePressed) {
      deathScreen =false;
      screen0 = false;
      gameScreen = true;
    }
  }

  if (gameScreen == true) {
    background (#000000);

    // calling the classes and thier functions to be used on the page.
    myBall1.move();
    myBall1.bounce();
    myBall1.p_bounce(myPlayer1);
    myPlayer1.display();
    myBall1.display();
    myScore.display();

    // loading the placements and functions for the array in draw to load thier values every frame, in case on a change because of input
    for (int i = 0; i < bricks; i++) {
      for (int j = 0; j < brick_rows; j++) {
        grid[i][j].display();
        myBall1.b_bounce(grid[i][j]);
        myScore.reset(grid[i][j]);
      }
    }
    
    // defining the trail coordinates in relation to the ball´s
    trailX[indexPos]=ballX;
    trailY[indexPos]=ballY;
    indexPos= (indexPos+1) % num;

    // initializing an array to load the trail of the ball in a loop
    for (int i = 0; i < num; i++) {
      int pos = (indexPos + i) % num;
      float r = (ballR+i)/2;
      int transparency =20 +i*20;
      noStroke();
      fill(ball_color, transparency);
      ellipse(trailX[pos], trailY[pos], r, r);
    }
  }

  if (deathScreen == true) {
    
    // describing was is to be shown on the death screen
    background (backgroundColor);
    textSize(deathTextSize);
    fill(deathTextColor);
    textMode(CENTER);
    text(deathText, deathTextX, deathTextY);
    textSize(finalScoreTextSize);
    text(finalScoreText+ score, finalScoreX, finalScoreY);
    textSize(retryTextSize);
    text(retryText, retryTextX, retryTextY);
    
    // resetting the score and location of bricks, while taking the user back to the game screen
    if (mousePressed) {
      deathScreen =false;
      screen0 = false;
      gameScreen = true;
      score =0;
      ySpeed=5;
      ballX = OGballX;
      ballY = OGballY;
      for (int i = 0; i < bricks; i++) {
        for (int j = 0; j < brick_rows; j++) {
          grid[i][j] = new Bricks(i*brickSpacingX+offset, j*brickSpacingY, brick_width, brick_height);
        }
      }
    }
  }
}
