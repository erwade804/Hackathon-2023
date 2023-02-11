int unitSize = 50;
int x = 0;
int y = 0;
String mode = "freeRoam";

int scrollSpeed = 10;

void setup(){
  fullScreen();
  noFill();
  stroke(255, 255, 255);
  println(width/unitSize);
  print(height/unitSize);
}

void draw(){
  keyboardInput();
  background(51);
  drawGrid();
  //print(x, ' ', y);
}
