import processing.sound.*;
String mode = "mainMenu";
String savedDialogMode = "freeRoam";
boolean sound = false;
// global variables
//player camera position
int x = 0;
int y = 0;
String currentString;

//selected soundtrack
int cycle = 1;
//Has enough of the game been to start
boolean loaded = false;
int soundLoaded = 0;
boolean stopped = false;
float volume = .35; // max volume is .3
Sound s;

// selected build
int buildCategory = 0;
//Max number of categorys of buildings
int maxBuildCategory = 0;
//Scroll wheel for subcategory
int subCategoryScroll = 0;
building selectedBuilding;

// resources
int stone = 60;
int iron = 50;
int wood = 100;
int food = 100;
int money = 800;
int steel = 0;
int gold = 0;
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
int lastSecondTracked;
int lastSecondUpdated;

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

// resourceImages
PImage goldImg, ironImg, moneyImg, planksImg, steelImg, approvalImg, happinessImg, stoneImg, woodImg, foodImg;

//text box
PImage textBox;

String longText;

PFont resourceFont, textFont;

ArrayList<event> allEvents;
ArrayList<event> eventQueue;
event currentEvent;

void setup() { // before the game starts
  fullScreen();
  noFill();
  menuSoundTrack = new SoundFile(this, "menu-music.mp3");
  thread("threadIt");
  eventQueue = new ArrayList<event>();
  allEvents = new ArrayList<event>();
  eventsInit();
  eventQueue.add(allEvents.get(0));
  eventQueue.add(allEvents.get(1));
  currentEvent = allEvents.get(0);
  startbutton = loadSprite("grayStart.png");
  optionsbutton = loadSprite("options.png");
  exitbutton = loadSprite("exit.png");
  goldImg = loadSprite("Gold.png");
  ironImg = loadSprite("Iron.png");
  planksImg = loadSprite("Planks.png");
  steelImg = loadSprite("Steel.png");
  stoneImg = loadSprite("Stone.png");
  woodImg = loadSprite("Wood.png");
  foodImg = loadSprite("Bread.png");
  happinessImg = loadSprite("happinessRating.png");
  moneyImg = loadSprite("Money.png");
  approvalImg = loadSprite("approvalRating.png");
  textBox = loadSprite("textBox.png");
  textBox.resize(1380, 760);
  currentString = "";
  s = new Sound(this);
  s.volume(volume);
  stroke(255, 255, 255);
  rectMode(CORNERS); // used for rect
  initbuildings();
  for (int i = 0; i < mapWidth; i++) { // loads map into memory
    for (int j = 0; j < mapHeight; j++) {
      maps[i][j] = loadMap(i, j);
    }
  }
  longText = intro;
  resourceFont = createFont("Arial", 18);
  textFont = createFont("Comic Sans MS", 30);
}

void threadIt() { //
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

void draw() {
  //green background
  background(34, 177, 35);
  drawGame();
  if (eventQueue.size() > 0 && !(mode == "mainMenu" || mode == "options")) {
    changeMode("dialog");
  }
  trackTime();
}
