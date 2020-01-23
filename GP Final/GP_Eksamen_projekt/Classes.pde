class Player {

  // defining the local variables for the player class
  int x;
  int y;
  int p_height;
  int p_width;
  int p_color;
  int p_transparency;
  
  //defining the variables of the constructor
  Player(int temp_x, int temp_y, int temp_width, int temp_height, int temp_color, int temp_transparency) {
    x=temp_x;
    y=temp_y;
    p_height=temp_height;
    p_width=temp_width;
    p_color=temp_color;
    p_transparency=temp_transparency;
  }

// using the values defined to display a rectangle with the variables of the class
  void display() {
    
    fill(p_color);
    rectMode(CENTER);
    x = mouseX;
    rect(x, y, p_width, p_height, p_transparency);
  }
}
class ball {

  int x;
  int y;
  int r;
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
  // describing the movement, so if called in draw the values ballX/Y will change with x/ySpeed per frame
  void move() {

    ballX+=xSpeed;
    ballY+=ySpeed;
  }
  // describing the boundaries of the ball. making sure the velocity is reversed if equal to or beyond the walls
  void bounce() {
    if (ballX>width-r) {
      xSpeed *= -1;
      sound3.play();
    }
    if (ballX<0+r) {
      xSpeed *= -1;
      sound3.play();
    }
    if (ballY<0+r) {
      ySpeed *= -1;
      sound3.play();
    }
    // deactivating the gamestate if the ball hits the floor
    if (ballY>height-r) {
      ySpeed *= -1;
      sound5.play();
      deathScreen =true;
      screen0 = false;
      gameScreen = false;
    }
  }
  // describing how the ball will bounce when colliding with the player paddle.
  void p_bounce(Player other) {
    //   println(other.x);
    // println(other.y);
    if ( ballY >= other.y-other.p_height && ballX < other.x+other.p_width/2 && ballX > other.x-other.p_width/2) {
      ySpeed *= -1;
      // adjusting the angle of the balls velocity, in relation to where it hits the player paddle. Credit: Signe Toftgaard Henriksen
      xSpeed = (ballX - other.x)/10;
      sound2.play();
    }
  }
  // describing how the ball reverses its movement when hitting either side of any of the bricks, and activating a sound effect
  void b_bounce(Bricks other) {
    if (ballY-r <= other.b_y+other.b_h && ballY+r >= other.b_y && ballX >= other.b_x && ballX <= other.b_x+other.b_w) {
      ySpeed *= -1;
      // when the ball hits a brick, the brick will be moved to the deadspace coordinates, and the score will increase by 1.
      other.b_x=deadspace;
      other.b_y=deadspace;
      score +=1;
      sound1.play();
    }
    if (ballY+r >= other.b_y && ballY-r <= other.b_y+other.b_h && ballX <= other.b_x+other.b_w && ballX >= other.b_x) {
      xSpeed *= -1;
      other.b_x=deadspace;
      other.b_y=deadspace;
      score +=1;
      sound1.play();
    }
    if ( ballX-r <= other.b_x+other.b_w && ballX+r >= other.b_x+other.b_w && ballY <= other.b_y+other.b_h && ballY >= other.b_y) {
      xSpeed *= -1;
      other.b_x=deadspace;
      other.b_y=deadspace;
      score +=1;
      sound1.play();
    }
    if ( ballX+r >= other.b_x+other.b_w && ballX-r <= other.b_x+other.b_w && ballY >= other.b_y+other.b_h && ballY <= other.b_y) {
      xSpeed *= -1;
      other.b_x=deadspace;
      other.b_y=deadspace;
      score +=1;
      sound1.play();
    }
  }
}

class Bricks {

  float b_x, b_y;
  float b_w, b_h;
  boolean b_dead;

  Bricks(float tempX, float tempY, float tempW, float tempH) {
    b_x = tempX;
    b_y = tempY;
    b_w = tempW;
    b_h = tempH;
  }
  // describing the rectangle placed on the coordinates given by the array
  void display () {
      fill(brickColor);
      rectMode(CORNER);
      rect(b_x, b_y, b_w, b_h);
  }
}
class Scoreboard {

  Scoreboard (int tempScore, int tempX, int tempY) {
    score=tempScore;
    scoreX=tempX;
    scoreY=tempY;
  }
  // describing how the score is displayed.
  void display() {
    textMode(CENTER);
    textSize(scoreTextSize);
    text(score, scoreX, scoreY);
    // telling the programme that if the score is over the "max score" the max score will be increased, but so will the speed of the ball. also activating the boolean lvlClear which.
    if (score >= maxScore) {
      lvlClear =true;
      maxScore += scorePerLvl;
    }
  }
  // when the boolean is true, the bricks and thier locations will be reset in the array so the player can continue the game. afterwards the boolean is returned to false, as to not do this many times per second.
  void reset (Bricks other) {
    if (lvlClear == true) {
      ballX = OGballX;
      ballY = OGballY;
      for (int i = 0; i < bricks; i++) {
        for (int j = 0; j < brick_rows; j++) {
          grid[i][j] = new Bricks(i*brickSpacingX+offset, j*brickSpacingY, brick_width, brick_height);
        }
      }
      ySpeed *=speedMultiplier;
      sound4.play();
      lvlClear =false;
    }
  }
}
