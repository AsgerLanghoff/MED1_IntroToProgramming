
// størrelsen på firkanterne
int spacing=50;

void setup() {
  size(500, 500);
  background (0);

// loop der konstruerer mine firkanter. 
  for (int x=0; x < width; x+=spacing) { // beskriver x værdierne af mine firkanter
    for (int y=0; y<height; y+=spacing) { // beskriver y værdierne af mine firkanter
      fill(random (255)); // firkanternes startfarve
      rect(x, y, spacing, spacing);
    }
  }
}
// handling der skal farve den valgte firkant rød
  void draw() {
    if (mousePressed) {
    fill(255,0,0);
    
    
    // dette deler min x og y værdi op til den nærmeste spacing på 50.
    // "%" udregner "remainder" altså den nærmeste tal der går op i 50 hvilket så er min start x og y værdi for min nye røde rect.
    int farveX = mouseX - (mouseX % spacing);
    int farveY = mouseY - (mouseY % spacing);
    
    rect(farveX,farveY,spacing,spacing);
    
    }
  }
