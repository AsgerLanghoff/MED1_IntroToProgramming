import processing.sound.*; // importing the sound library, making it possible the use sound files and the commands to activate them.

// variables used to define the player paddle
int p_width =200;
int p_height =25;
int p_y=450;
int p_color =#0530FF;
int p_transparency=0;
int p_middle=mouseX;

// defining the standard background color
int backgroundColor=#000000;

// all the values of the ball including speed, placement, color and speed multiplier
float xSpeed =5;
float ySpeed =5;
float speedMultiplier =1.2;
int ballX = 500;
int ballY = 250;
int OGballX = 500;
int OGballY = 250;
int ballR =15;
int ball_color=#FFFFFF;

// the values given to the 2d array in order to create the pattern of bricks
int brick_width=150;
int brick_height=25;
int brick_rows=4; // the amount of rows of bricks
int bricks=5; // the amount of bricks per row
int brickSpacingX =175; // the x value of spacing between the bricks
int brickSpacingY =40; // the y value of spacing between the bricks
int offset = 55; // x value distance from the left wall, where the array of bricks start.
int brickColor = #FF0505;
float deadspace = -100; // the x and y value given to the bricks when hit, putting them outsite of the play area.

// booleans describing the different states of the game.
boolean lvlClear;
boolean gameScreen;
boolean deathScreen;
boolean screen0;

// the values used for the score.
int maxScore=20;
int scorePerLvl=20;
int score;
int scoreX=500;
int scoreY=250;
int scoreTextSize = 100;

// definint the trail arrays along with their values
int num = 10;
int [] trailX = new int [num];
int [] trailY = new int [num];
int indexPos = 0;

// the values assosiated with the text on the deathScreen
String deathText = "you died";
int deathTextSize = 150;
int deathTextX = 175;
int deathTextY = 200;
int deathTextColor = #FF0000;
String finalScoreText = "Final score:";
int finalScoreX = 250;
int finalScoreY = 300;
int finalScoreTextSize = 75;
String retryText = "click to retry";
int retryTextSize = 50;
int retryTextX = 300;
int retryTextY = 375;

// the values assosiated with the text on screen 0

int screen0TextSize =100;
String screen0Text = "Welcome to\nAtari Breakout\non processing!";
int screen0TextX = 150;
int screen0TextY = 100;
int screen0TextSize2 =25;
String screen0Text2 = "Click on the mouse to start the game!";
int screen0TextX2 = 225;
int screen0TextY2 = 465;

// naming the soundfiles, to be called later in the programme
SoundFile sound1;
SoundFile sound2;
SoundFile sound3;
SoundFile sound4;
SoundFile sound5;

// naming the classes 
Player myPlayer1;
Scoreboard myScore;
ball myBall1;

// defining and naming the 2d array
Bricks [] [] grid;
