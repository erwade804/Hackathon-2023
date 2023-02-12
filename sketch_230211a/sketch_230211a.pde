import processing.sound.*;
String mode = "build";
boolean sound = false;
// global variables
//player camera position
int x = 0;
int y = 0;
//selected soundtrack
int cycle = 1;
//Has enough of the game been to start
boolean loaded = false;
int soundLoaded = 0;
boolean stopped = false;
float volume = .3; // max volume is .3
Sound s;

// selected build
int buildCategory = 0;
//Max number of categorys of buildings
int maxBuildCategory = 0;
//Scroll wheel for subcategory
int subCategoryScroll = 0;
building selectedBuilding;

// resources
int stone = 50;
int iron = 50;
int wood = 100;
int food = 75;
int money = 400;
int steel = 0;
int planks = 0;
int happiness = 10;
int approval = 30;

// constants
static int mapWidth = 10;
static int mapHeight = 10;
static int scrollSpeed = 10;
static int unitSize = 50;

// time
int year = 0;
int months = 0;
int days = 0;

// states
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
  //Visual que that game is ready to start
  startbutton = loadSprite("start.png");
  loaded = true;
  //load addition soundtracks in the background
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
  //green background
  background(34,177,35);
  drawGame();
}
