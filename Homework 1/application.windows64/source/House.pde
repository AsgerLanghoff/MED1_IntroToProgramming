size(600,500);

//jorden
line(0,400,600,400);

//selve huset
fill(#C9960A);
rect(200,200,200,200);

//vinduerene
fill(#FFFEFA);
//vestre vindue
rect(225,225,50,50);
line(250,225,250,275);
line(225,250,275,250);

//Højre vindue
rect(325,225,50,50);
line(350,225,350,275);
line(325,250,375,250);

//døren
fill(#EA9B1A);
rect(275,320,50,80);
ellipse(290,360,10,10);

//tag
fill(#E06507);
triangle(200,200,400,200,300,100);
