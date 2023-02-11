import processing.sound.SoundFile;

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
String mode = "mainMenu";
boolean showHover = true;

// memory access
Map[][] maps = new Map[mapWidth][mapHeight];
ArrayList<building> buildings = new ArrayList <building>();

//Music
SoundFile menuSoundTrack;

void setup(){ // before the game starts
  fullScreen();
  noFill();
  menuSoundTrack = new SoundFile(this, "menu-music.mp3");
  stroke(255, 255, 255);
  rectMode(CORNERS); // used for rect
  initbuildings();
  for(int i = 0; i < mapWidth; i++){ // loads map into memory
    for(int j = 0; j < mapHeight; j++){
      maps[i][j] = loadMap(i, j);
    }
  }
}

void draw(){
  keyboardInput();
  background(34,177,35);
  drawGame();
  //PImage img = buildings.get(0).art;
  //img.resize(50,50);
  //image(img, 0, 0);
}
