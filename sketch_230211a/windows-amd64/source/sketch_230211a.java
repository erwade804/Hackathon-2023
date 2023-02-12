/* autogenerated by Processing revision 1291 on 2023-02-12 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import processing.sound.*;
import processing.sound.SoundFile;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class sketch_230211a extends PApplet {


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
float volume = .35f; // max volume is .3
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

public void setup() { // before the game starts
  /* size commented out by preprocessor */;
  noFill();
  menuSoundTrack = new SoundFile(this, "menu-music.mp3");
  thread("threadIt");
  eventQueue = new ArrayList<event>();
  allEvents = new ArrayList<event>();
  eventsInit();
  eventQueue.add(allEvents.get(0));
  eventQueue.add(allEvents.get(1));
  eventQueue.add(allEvents.get(2));
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

public void threadIt() { //
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

public void draw() {
  //green background
  background(34, 177, 35);
  drawGame();
  if (eventQueue.size() > 0 && !(mode == "mainMenu" || mode == "options")) {
    changeMode("dialog");
  }
  trackTime();
}
public void initbuildings () { // all bulidings to memory
  // population
  //buildings.add(new building("shack", 1, 1, "shack.png", 1, 1, null, color(0, 0, 1), [120, 0, 10, 0, 0, 0]));
  buildings.add(new building("shack", 1, 1, "shack.png", 3, 1, null, color(0, 0, 1), 120, 0, 10, 0, 0, 0, 0, 1, 2));
  buildings.get(0).art.resize(50, 50);
  buildings.add(new building("family house", 2, 2, "familyHouse.png", 6, 3, null, color(0, 1, 2), 400, 20, 40, 0, 0, 0, 0, 1, 2));
  buildings.get(1).art.resize(50, 50);
  buildings.add(new building("fancy house", 10, 10, "fancyHouse.png", 15, 6, null, color(0, 2, 3), 1000, 50, 100, 35, 0, 20, -1, 1, 2));
  buildings.get(2).art.resize(50, 100);
  buildings.add(new building("mansion", 10, 10, "mansion.png", 25, 10, null, color(0, 3, 4), 1600, 70, 140, 50, 0, 45, -2, 1, 2));
  buildings.get(3).art.resize(100, 100);

  // food
  buildings.add(new building("farm", 10, 10, "farmHouse.png", 2, 0, null, color(1, 0, 1), 150, 0, 20, 0, 0, 0, 0, 2, 1));
  buildings.get(4).art.resize(50, 50);
  buildings.add(new building("fishing wharf", 10, 10, "fishingWharf.png", 5, 2, null, color(1, 1, 1), 200, 15, 15, 0, 0, 0, 0, 2, 1));
  buildings.get(5).art.resize(50, 50);


  // resources, not linked
  buildings.add(new building("stone quarry", 10, 10, "Stonequarry.png", 3, 1, null, color(2, 0, 1), 200, 0, 20, 30, 0, 0, 0, 3, 1));
  buildings.get(6).art.resize(50, 50);
  buildings.add(new building("woodcutters hut", 10, 10, "WoodHut.png", 3, 1, null, color(2, 1, 1), 180, 20, 20, 0, 0, 0, 0, 4, 1));
  buildings.get(7).art.resize(50, 50);
  buildings.add(new building("logging industry", 10, 10, "LoggingFactory.png", 12, 6, null, color(2, 2, 2), 700, 450, 300, 70, 0, 0, 10, 8, 4));
  buildings.get(8).art.resize(100, 100);
  buildings.add(new building("iron mine", 10, 10, "Ironmine.png", 5, 3, null, color(2, 3, 1), 300, 30, 20, 0, 0, 0, 2, 5, 1));
  buildings.get(9).art.resize(50, 50);
  //buildings.add(new building("smeltry", 10, 10, "", 15, 6, null, color(2, 4, 2), 800, 350, 250, 400, 0, 100, 15));
  buildings.add(new building("smeltry", 10, 10, "SteelFactory.png", 10, 6, null, color(2, 4, 2), 800, 350, 250, 400, 0, 100, 5, 6, 5));
  buildings.get(10).art.resize(100, 100);
  buildings.add(new building("gold mine", 10, 10, "Goldmine.png", 10, 0, null, color(2, 5, 1), 150, 30, 0, 15, 0, 0, 1, 7, 0));
  buildings.get(11).art.resize(50, 50);

  // government buildings
  //buildings.add(new building("town hall", 10, 10, "Townhall.png", 0, 0, null, color(250,0,0), 0, 0, 0, 0, 0, 0, 0));
  //buildings.get(10).art.resize(150, 150);
  //buildings.add(new building("bank", 10, 10, "", 1, 0, null, color(3, 0, 1), 1500, 250, 0, 150, 30, 50, -3));
  //buildings.get(9).art.resize(100, 100);
  maxBuildCategory = 4;

  //Wonder
  buildings.add(new building("presidential Statue", 600, 600, "presidentkiwi.png", 40, 0, null, color(4, 2, 1), 10000, 3000, 3000, 2000, 500, 750, -20, 0, 0));
  //buildings.get(10).art.resize(600, 600);

  //buildings.add(new building("police Station", 10, 10, "", 1, 0, null, color(0, 0, 11), 0, 0, 0, 0, 0, 0, -2));
  //buildings.get(10).art.resize(50, 100);
  //buildings.add(new building("fire Station", 10, 10, "", 1, 0, null, color(0, 0, 12), 0, 0, 0, 0, 0, 0, -3));
  //buildings.get(10).art.resize(50, 100);
  //buildings.add(new building("medicial Clinic", 10, 10, "Clinic.png", 1, 0, null, color(0, 0, 13), 0, 0, 0, 0, 0, 0, -3));
  //buildings.get(11).art.resize(50, 100);
  //buildings.add(new building("hospital", 10, 10, "", 1, 0, null, color(0, 0, 14), 0, 0, 0, 0, 0, 0, 0));
  //buildings.add(new building("post Office", 10, 10, "", 1, 0, null, color(0, 0, 16), 0, 0, 0, 0, 0, 0, -2));
  //buildings.get(10).art.resize(50, 100);
  //buildings.add(new building("park Trees", 10, 10, "", 1, 0, null, color(0, 0, 17), 0, 0, 0, 0, 0, 0, -4));
  //buildings.get(10).art.resize(100, 50);
  //buildings.add(new building("park Fountain", 10, 10, "", 1, 0, null, color(0, 0, 18), 0, 0, 0, 0, 0, 0, -6));
  //buildings.get(10).art.resize(100, 50);
  //buildings.add(new building("storage Center", 10, 10, "", 1, 0, null, color(0, 0, 19), 0, 0, 0, 0, 0, 0, 0));
  //buildings.get(10).art.resize(100, 50);
  //buildings.add(new building("warehouse", 10, 10, "", 1, 0, null, color(0, 0, 20), 0, 0, 0, 0, 0, 0, 0));
  //buildings.get(10).art.resize(150, 100);
  //buildings.add(new building("university", 10, 10, "", 1, 0, null, color(0, 0, 21), 0, 0, 0, 0, 0, 0, 0));
  //buildings.get(10).art.resize(100, 100);
}
class building {
  String name;
  int blength;
  int bwidth;
  PImage art;
  int yield;
  int upkeep;
  PVector location;
  int mapColor;
  String description;
  String filePath;
  //int[6] costarray;
  int price, stonecost, woodcost, ironcost, steelcost, plankcost, happinesscost;
  int yeildType;
  int upkeepType;

  building(String namecreate, int blengthcreate, int bwidthcreate, String artFilePath, int yieldcreate, int upkeepcreate, PVector locationcreate, int mapColors, int price_, int stone, int wood, int iron, int steel, int plank, int happy, int yeildType_, int upkeepType_) {
    name = namecreate;
    blength = blengthcreate;
    bwidth = bwidthcreate;
    filePath = artFilePath;
    yield = yieldcreate;
    upkeep = upkeepcreate;
    location = locationcreate;
    mapColor = mapColors;
    art = loadSprite(filePath);
    //costarray = costs;
    price = price_;
    stonecost = stone;
    woodcost = wood;
    ironcost = iron;
    steelcost = steel;
    plankcost = plank;
    happinesscost = happy;
    yeildType = yeildType_;
    upkeepType = upkeepType_;
  }

  public void setDescription(String paragraph) {
    description = paragraph;
  }

  public String toString () {
    return("" + this.name + " " + this.blength + " " + this.bwidth + " " + this.yield + " " + this.upkeep + "" + this.mapColor);
  }

  public boolean canAfford() {
    //println(price <= money, stonecost <= stone, woodcost <= wood, ironcost <= iron, plankcost <= planks);
    if (price <= money && stonecost <= stone && woodcost <= wood && ironcost <= iron && plankcost <= planks) {
      return true;
    }
    return false;
  }

  public void subPrice() {
    money -= price;
    stone -= stonecost;
    wood -= woodcost;
    iron -= ironcost;
    planks -= plankcost;
  }
}

public PImage loadSprite(String fileName) { // loads sprite and returns
  try {
    return loadImage("Sprites/"+fileName);
  }
  catch(Exception e) {
    return createImage(0, 0, RGB);
  }
}


public void drawGrid() { // draw's grid
  if (sound) {
    mainGameSoundtrack();
  }
  // draw maps here when writen
  // gather the 15 maps to draw
  int newx = width/2-x; // newx newy for map position in world not screen
  int newy = height/2-y;
  int mapx = newx/(mapWidth*unitSize); // which map the mouse is on
  int mapy = newy/(mapHeight*unitSize);
  int squarex = newx/unitSize; // which square the mouse is on
  int squarey = newy/unitSize;

  //println("maps", mapx, mapy);
  // get maps within range of 1-10 for x and y
  Map[][] renderedMaps = new Map[5][3];
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 3; j++) {
      if (mapx-2+i >= 0 && mapx-2+i <= 9 && mapy-1 +j >= 0 && mapy-1+j <=9) {
        renderedMaps[i][j] = maps[mapx-2+i][mapy-1+j];
      }
    }
  }
  //stop();

  for (int i = 0; i< 5; i++) {
    for (int j = 0; j < 3; j++) {
      drawMap(renderedMaps[i][j]);
    }
  }

  // hover if needs to show hover
  hover();
}


//For hover icon
public void hover() {
  if (mouseX > width-200 && mouseX < width-150) { // selection's x range
    for (int i = 0; i< 6; i++) {
      if (mouseY > 100*(i+1) && mouseY < 100*(i+1) + 50) { // 6 individual y ranges (repeating if more than 6)
        ArrayList <building> buildingsInCategory = new ArrayList<building>(); // allowed buildings in category
        for (building a : buildings) {
          if (red(a.mapColor) == buildCategory) { // if the building is in the category, add it to the list of allowed buildings
            buildingsInCategory.add(a);
          }
        }
        building build = buildingsInCategory.get(i % buildingsInCategory.size()); // get selected buliding from mouse click
        fill(71);
        //rect(0, 0, mouseX, mouseY);
        rect(mouseX-150, mouseY-150, mouseX, mouseY);
        fill(0);
        text(build.name, mouseX-145, mouseY-125);
        int z = 1;
        text("Money: " + build.price, mouseX-145, mouseY-125+(z*20));
        z++;
        if (build.stonecost > 0) {
          text("Stone: " + build.stonecost, mouseX-145, mouseY-125+(z*20));
          z++;
        }
        if (build.woodcost > 0) {
          text("Wood: " + build.woodcost, mouseX-145, mouseY-125+(z*20));
          z++;
        }
        if (build.ironcost > 0) {
          text("Iron: " + build.ironcost, mouseX-145, mouseY-125+(z*20));
          z++;
        }
        if (build.steelcost > 0) {
          text("Steel: " + build.steelcost, mouseX-145, mouseY-125+(z*20));
          z++;
        }
        if (build.plankcost > 0) {
          text("Planks: " + build.plankcost, mouseX-145, mouseY-125+(z*20));
          z++;
        }
        text("Happiness: " + build.happinesscost, mouseX-145, mouseY-125+(z*20));
      }
    }
  }


  // hover if needs to show hover
  if (showHover) {
    int newx = mouseX -x; // newx newy for map position in world not screen
    int newy = mouseY -y;
    int mapx = newx/(mapWidth*unitSize); // which map the mouse is on
    int mapy = newy/(mapHeight*unitSize);
    int squarex = newx/unitSize; // which square the mouse is on
    int squarey = newy/unitSize;
    fill(0, 0, 255);

    //println(mapx, mapy);
    pushMatrix();
    translate(x, y);
    //image()// get building.art
    if (selectedBuilding != null) {
      image(selectedBuilding.art, squarex*unitSize, squarey*unitSize);
    }
    //rect(squarex*unitSize, squarey*unitSize, squarex*unitSize+unitSize, squarey*unitSize+unitSize); // draw square
    popMatrix();
    noFill();
  }
}

public void drawMenu() {
  background(0xFF87CEEB);
  if (!menuSoundTrack.isPlaying()) {
    menuSoundTrack.play();
  }
  image(startbutton, width/2-200, 100);
  image(optionsbutton, width/2-200, 300);
  image(exitbutton, width/2-200, 500);
}


//Side bar menu ingame
public void drawBuildUI() {
  pushMatrix();
  translate(width, 0);
  fill(72);
  rect(0, 0, -350, height);
  fill(51);
  rect(-300, 50, -50, 20);
  rect(-50, 20, -20, 50, 0, 18, 18, 0);
  rect(-330, 20, -300, 50, 18, 0, 0, 18);
  triangle(-43, 27, -43, 42, -28, 35);
  triangle(-307, 27, -307, 42, -322, 35);
  // top right is origin
  // find the buildings in category
  ArrayList <building> buildingsInCategory = new ArrayList<building>();
  for (building a : buildings) {
    if (red(a.mapColor) == buildCategory) {
      buildingsInCategory.add(a);
    }
  }
  //Implements an infinit scroll on sub categories
  for (int i = 0; i < 6; i++) {
    if (buildingsInCategory.size() == 0) {
    } else
      image(buildingsInCategory.get(abs((subCategoryScroll+i)%buildingsInCategory.size())).art, -200, 100 * (i+1));
  }
  popMatrix();
}

//Cycles through soundtrack
public void mainGameSoundtrack() {
  if (loaded) {
    if (!gameSoundTrack1.isPlaying() && cycle == 1) {
      gameSoundTrack1.play();
    } else if (gameSoundTrack1.percent() >= 98.5f) {
      cycle += 1;
    }
  } else {
    return;
  }
  if (cycle == 2) {
    if (!gameSoundTrack2.isPlaying()) {
      gameSoundTrack2.play();
    } else if (gameSoundTrack2.percent() >= 98.5f) {
      cycle += 1;
    }
  }
  if (cycle == 3) {
    if (!gameSoundTrack3.isPlaying()) {
      gameSoundTrack3.play();
    } else if (gameSoundTrack3.percent() >= 98.5f) {
      cycle += 1;
    }
  }
  if (cycle == 4) {
    if (!gameSoundTrack4.isPlaying()) {
      gameSoundTrack4.play();
    } else if (gameSoundTrack4.percent() >= 98.5f) {
      cycle += 1;
    }
  }
  if (cycle == 5) {
    if (!gameSoundTrack5.isPlaying()) {
      gameSoundTrack5.play();
    } else if (gameSoundTrack5.percent() >= 98.5f) {
      cycle = 1;
    }
  }
}

public void drawOptions() { // put options here :P
  image(exitbutton, width/2-200, 500);
}

public void drawProgress() {
  fill(51);
  rect(0, 0, width, 10);
  fill(0, 255, 0);
  rect(0, 0, width*soundLoaded/5, 10);
}

public void drawResourceText() {
  textFont(resourceFont);
  fill(0);
  image(moneyImg, 30, 10);
  text(money, 80, 20);
  text(food, 150, 20);
  image(foodImg, 100, 6);
  text(stone, 217, 20);
  image(stoneImg, 170, 7);
  text(wood, 290, 20);
  image(woodImg, 240, 5);
  text(iron, 360, 20);
  image(ironImg, 310, 0);
  text(approval, 430, 20);
  image(approvalImg, 380, 5);
  text(happiness, 500, 20);
  image(happinessImg, 450, 5);
  text(planks, 570, 20);
  pushMatrix();
  rotate(PI/2);
  image(planksImg, 0, -567);
  popMatrix();
  text(gold, 640, 20);
  image(goldImg, 590, 0);
  text(steel, 710, 20);
  image(steelImg, 660, 5);
}

public void drawDialog() {
  image(textBox, 0, 0);
  drawText(longText);
}
//Draws game based on mode
public void drawGame() {
  if (mode == "freeRoam") {
    drawGrid();
    showHover = false;
    drawResourceText();
  } else if (mode == "build") {
    drawGrid();
    drawBuildUI();
    showHover = true;
    drawResourceText();
    hover();
  } else if (mode == "mainMenu") {
    drawMenu();
    drawProgress();
  } else if (mode == "options") {
    drawOptions();
    drawProgress();
  } else if (mode == "dialog") {
    drawGrid();
    showHover = false;
    drawDialog();
  }
}
class event {
  String dialog;
  int triggerId;
  int nextTrigger;
  event(String dialog_, int triggerId_, int nextTrigger_) {
    dialog = dialog_;
    triggerId = triggerId_;
    nextTrigger = nextTrigger_;
  }
  event(String dialog_, int triggerId_) {
    dialog = dialog_;
    triggerId = triggerId_;
    nextTrigger = -1;
  }
}

public void eventsInit() {
  allEvents.add(new event(intro, 1, 2));
  allEvents.add(new event(intro2, 2, 3));
  allEvents.add(new event("Press 'b' to open up the build menu!", 3));
}


public void keyPressed() { // keyboard mode select switch
  if (mode == "freeRoam") {
    freeRoamKeyboard();
  } else if (mode == "build") {
    buildModeKeyboard();
  } else if (mode == "dialog") {
    dialogMouse();
  }
}


public void mouseClicked() {
  setVolume();
  if (mode == "dialog") {
    dialogMouse();
  }
  if (mode == "freeRoam") {
    freeRoamMouse();
  }
  if (mode == "mainMenu") {
    mainMenuMouse();
  }
  if (mode == "options") { // options mode (from main menu)
    optionsMouse();
  }
  if (mode == "build") { // build mode
    buildMouse();
  }
}




public void freeRoamKeyboard() { // keyboard checks for free roam
  if (key == 'w') {
    y += scrollSpeed;
  } else if (key == 's') {
    y -= scrollSpeed;
  } else if (key == 'a') {
    x += scrollSpeed;
  } else if (key == 'd') {
    x -= scrollSpeed;
  } else if (key == 'b') {
    changeMode("build");
  }
}

public void buildModeKeyboard() { // keyboard checks for build mode
  if (key == 'w') {
    y += scrollSpeed;
  } else if (key == 'b') {
    changeMode("freeRoam");
  } else if (key == 's') {
    y -= scrollSpeed;
  } else if (key == 'a') {
    x += scrollSpeed;
  } else if (key == 'd') {
    x -= scrollSpeed;
  } else if (keyCode == UP) { // selecting sub category
    subCategoryScroll -= 1;
  } else if (keyCode == DOWN) {
    subCategoryScroll += 1;
  } else if (keyCode == RIGHT) { // selecting category
    buildCategory += 1;
    if (buildCategory > maxBuildCategory) {
      buildCategory = 0;
    }
  } else if (keyCode == LEFT) {
    buildCategory -= 1;
    if (buildCategory < 0) {
      buildCategory = maxBuildCategory;
    }
  }
}


public void freeRoamMouse() {
}


public void mainMenuMouse() {
  if (mouseX>width/2-200 && mouseX < width/2+200) { // button x range
    if (mouseY > 100 && mouseY < 300) { // play button
      if (loaded) { // if game is ready to play
        changeMode("freeRoam");
      }
    }
    if (mouseY > 300 && mouseY < 500) { // options button
      changeMode("options");
    }
    if (mouseY > 500 && mouseY < 700) { // if exit button clicked
      stopped = true;
      stop();
    }
  }
}

public void optionsMouse() {
  if (mouseX > width/2-200 && mouseX < width/2 +200) { // button x range
    if (mouseY > 500 && mouseY < 700) { // button y range
      changeMode("mainMenu"); // change to main menu
    }
  }
}

public void buildMouse() {
  if (mouseX > width-350) { // if within the overlay
    // now in the overlay
    if (mouseX > width-200 && mouseX < width-150) { // selection's x range
      for (int i = 0; i< 6; i++) {
        if (mouseY > 100*(i+1) && mouseY < 100*(i+1) + 50) { // 6 individual y ranges (repeating if more than 6)
          ArrayList <building> buildingsInCategory = new ArrayList<building>(); // allowed buildings in category
          for (building a : buildings) {
            if (red(a.mapColor) == buildCategory) { // if the building is in the category, add it to the list of allowed buildings
              buildingsInCategory.add(a);
            }
          }
          selectedBuilding = buildingsInCategory.get(i % buildingsInCategory.size()); // get selected buliding from mouse click
        }
      }
    }
  } else { // not in overlay (must have building selected for anything to happen)
    if (selectedBuilding != null) {
      if (selectedBuilding.canAfford()) {
        int newx = mouseX-x; // newx newy for map position in world not screen
        int newy = mouseY-y;
        int mapx = newx/(mapWidth*unitSize); // which map the mouse is on
        int mapy = newy/(mapHeight*unitSize);
        int squarex = newx/unitSize%mapWidth; // which square the mouse is on
        int squarey = newy/unitSize%mapHeight;
        maps[mapx][mapy].mapImage.loadPixels();
        maps[mapx][mapy].mapImage.pixels[squarey*mapWidth + squarex] = selectedBuilding.mapColor;
        selectedBuilding.subPrice();
      }
    }
  }
}

public void dialogMouse() {
  if (eventQueue.get(0).nextTrigger != -1) {
    for (event e : eventQueue) {
      if (e.triggerId == eventQueue.get(0).nextTrigger) {
        currentEvent = e;
        longText = currentEvent.dialog;
      }
    }
  }
  eventQueue.remove(0);
  if (eventQueue.size() == 0) {
    mode = savedDialogMode;
    return;
  }
}
class Map{
  PVector miniMapCords;
  PImage mapImage;
  String FILENAME;
  
  Map(int x, int y){
    this.miniMapCords = new PVector(x, y);
    FILENAME = "map/map-"+x+"-"+y+".png";
    try{
      this.mapImage = loadImage(FILENAME);
      this.mapImage.loadPixels();
    }
    catch(Exception e){
      this.mapImage = createImage(10, 10, RGB);
      this.mapImage.save(FILENAME);
    }
  }
  
  public void renderMap(){
    
  }
}

public Map createMap(int x, int y){
  return new Map(x, y);
}

public Map loadMap(int x, int y){
  String fileName = "map/map-"+x+"-"+y+".png";
  try{
    return new Map(x, y);
  }
  catch(Exception e){
    PImage temp = createImage(10, 10, RGB);
    temp.loadPixels();
    for(int i = 0; i < 100; i++){
      temp.pixels[i] = color(0, 0, 0);
    }
    temp.save(fileName);
    return createMap(x, y);
  }
}

public void drawMap(Map map){
  if(map != null){
    noFill();
    map.mapImage.loadPixels();
    for(int i = 0; i < mapWidth; i++){
      for(int j = 0; j < mapHeight; j++){
        // draw the building it is
        pushMatrix();
        translate(x+map.miniMapCords.x*500, y+map.miniMapCords.y*500);
        for(building a: buildings){
          rect(j*unitSize, i*unitSize, (j+1)*unitSize, (i+1)*unitSize);
          if(map.mapImage.pixels[i*mapWidth + j] == a.mapColor){
            image(a.art, j*unitSize, i*unitSize);
          }
        }
        popMatrix();
      }
    }
  }
}
public void changeMode(String newMode) {
  if (mode == "mainMenu" && newMode != "options") {
    mode = newMode;
    menuSoundTrack.stop();
    mode = "dialog";
    return;
  }
  if (newMode == "dialog") {
    savedDialogMode = mode;
    mode = newMode;
  }
  if (mode == "dialog") {
    mode = savedDialogMode;
    savedDialogMode = "freeRoam";
    return;
  }
  mode = newMode;
  //mode = newMode;
  //menuSoundTrack.stop();
  //gameSoundTrack1.stop();
  //gameSoundTrack2.stop();
  //gameSoundTrack3.stop();
  //gameSoundTrack4.stop();
  //gameSoundTrack5.stop();
}

public void stopAllMusic() {
  menuSoundTrack.stop();
  gameSoundTrack1.stop();
  gameSoundTrack2.stop();
  gameSoundTrack3.stop();
  gameSoundTrack4.stop();
  gameSoundTrack5.stop();
}

public void setVolume() {
  s.volume(volume);
}

public void drawText(String text) {
  textFont(textFont);
  fill(102, 205, 66);
  currentString = "";
  text = text + " ";
  String[] texts = text.split(" ");
  ArrayList<String> lines = new ArrayList <String>();
  for (int i = 0; i < texts.length; i++) {
    currentString += " " + texts[i];
    if (textWidth(currentString) > 600) {
      lines.add(currentString);
      currentString = texts[i];
    }
    if (i == texts.length -1 ) {
      lines.add(currentString);
    }
  }
  for (int i = 0; i < lines.size(); i++) {

    text(lines.get(i), width/2-275, 530 + 30 * i);
  }
}
String intro = "Welcome El Presidente! Thank you for coming. Let's get right to business, our island town is in disarray, the people don't trust us, the economy is in shambles, and I've run out of ideas! ";
String intro2 = "But that's why you're here Mr. Kiwi. You can inspire the people and fix the island! A glorious age under your leadership awaits!";

public void trackTime() {
  if (second() != lastSecondTracked) {
    lastSecondUpdated += 1;
  }
  lastSecondTracked = second();
  if (lastSecondUpdated == 1) {
    tick();
    lastSecondUpdated = 0;
  }
}


public void tick() {
  //println("got here");
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      for (int k = 0; k < 100; k++) {
        maps[i][j].mapImage.loadPixels();
        for (building a : buildings) {
          if (a.mapColor == maps[i][j].mapImage.pixels[k]) {
            if (a.yeildType == 1) {
              if (food > a.upkeep) {
                food -= a.upkeep;
                money += a.yield;
              }
            } else if (a.yeildType == 2) {
              if (money > a.upkeep) {
                food += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 3) {
              if (money > a.upkeep) {
                stone += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 4) {
              if (money > a.upkeep) {
                wood += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 5) {
              if (money > a.upkeep) {
                iron += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 6) {
              if (money > a.upkeep) {
                steel += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 7) {
              money += a.yield;
            } else if (a.yeildType == 8) {
              if (money > a.upkeep) {
                planks += a.yield;
                wood -= a.upkeep;
              }
            }
          }
        }
      }
    }
  }
}


  public void settings() { fullScreen(); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "sketch_230211a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}