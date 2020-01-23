import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class House extends PApplet {
  public void setup() {


//jorden
line(0,400,600,400);

//selve huset
fill(0xffC9960A);
rect(200,200,200,200);

//vinduerene
fill(0xffFFFEFA);
//vestre vindue
rect(225,225,50,50);
line(250,225,250,275);
line(225,250,275,250);

//Højre vindue
rect(325,225,50,50);
line(350,225,350,275);
line(325,250,375,250);

//døren
fill(0xffEA9B1A);
rect(275,320,50,80);
ellipse(290,360,10,10);

//tag
fill(0xffE06507);
triangle(200,200,400,200,300,100);
    noLoop();
  }

  public void settings() { size(600,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "House" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
