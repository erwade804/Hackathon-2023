int unitSize = 50;
int x = 0;
int y = 0;
String mode = "freeRoam";
int mapWidth = 10;
int mapHeight = 10;
Map[][] maps = new Map[mapWidth][mapHeight];

int scrollSpeed = 10;

void setup(){
  fullScreen();
  noFill();
  stroke(255, 255, 255);
  rectMode(CORNERS);
  for(int i = 0; i < mapWidth; i++){
    for(int j = 0; j < mapHeight; j++){
      maps[i][j] = loadMap(i, j);
    }
  }
}

void draw(){
  rotate(PI/4);
  keyboardInput();
  background(51);
  drawGrid();
}
