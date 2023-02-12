import processing.sound.*;

// global variables
int x = 0;
int y = 0;
int cycle = 1;
int buildCategory = 0;
int maxBuildCategory = 0;
int subCategoryScroll = 0;
boolean loaded = false;
int soundLoaded = 0;
boolean stopped = false;
float volume = .005;
Sound s;

// selected build
building selectedBuilding;

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

//  Music
SoundFile menuSoundTrack;
SoundFile gameSoundTrack1;
SoundFile gameSoundTrack2;
SoundFile gameSoundTrack3;
SoundFile gameSoundTrack4;
SoundFile gameSoundTrack5;

// buttons
PImage startbutton, optionsbutton, exitbutton;

void setup(){ // before the game starts
  fullScreen();
  noFill();
  menuSoundTrack = new SoundFile(this, "menu-music.mp3");
  thread("threadIt");
  startbutton = loadSprite("grayStart.png");
  optionsbutton = loadSprite("options.png");
  exitbutton = loadSprite("exit.png");
  s = new Sound(this);
  s.volume(volume);
  stroke(255, 255, 255);
  rectMode(CORNERS); // used for rect
  initbuildings();
  for(int i = 0; i < mapWidth; i++){ // loads map into memory
    for(int j = 0; j < mapHeight; j++){
      maps[i][j] = loadMap(i, j);
    }
  }
}

void threadIt(){ // 
  gameSoundTrack1 = new SoundFile(this, "Track1.mp3");
  soundLoaded++;
  startbutton = loadSprite("start.png");
  loaded = true;
  gameSoundTrack2 = new SoundFile(this, "Track2.mp3");
  soundLoaded++;
  gameSoundTrack3 = new SoundFile(this, "Track3.mp3");
  soundLoaded++;
  gameSoundTrack4 = new SoundFile(this, "Track4.mp3");
  soundLoaded++;
  gameSoundTrack5 = new SoundFile(this, "Track5.mp3");
  soundLoaded++;
}

void draw(){
  background(34,177,35);
  drawGame();
}
