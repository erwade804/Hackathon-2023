// global variables
int x = 0;
int y = 0;

// resources
int stone = 0;
int wood = 0;
int food = 0;
int money = 0;
int steel = 0;
int planks = 0;
int happiness = 0;
int approval = 0;

// constants
int mapWidth = 10;
int mapHeight = 10;
int scrollSpeed = 10;
int unitSize = 50;

// time
int year = 0;
int months = 0;
int days = 0;

// states
String mode = "build";
boolean showHover = true;

// memory access
Map[][] maps = new Map[mapWidth][mapHeight];
ArrayList buildings = new ArrayList <building>();


void setup(){ // before the game starts
  fullScreen();
  noFill();
  stroke(255, 255, 255);
  rectMode(CORNERS); // used for rect
  initbuildings();
  for(int i = 0; i < mapWidth; i++){ // loads map into memory
    for(int j = 0; j < mapHeight; j++){
      maps[i][j] = loadMap(i, j);
    }
  }
  //noCursor(); // 
}

void draw(){
  keyboardInput();
  background(51);
  drawGrid();
  //line(mouseX, mouseY, mouseX+2, mouseY+2);
}
