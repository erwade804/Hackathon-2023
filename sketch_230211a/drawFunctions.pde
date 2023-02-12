import processing.sound.SoundFile;

void drawGrid(){ // draw's grid
  //mainGameSoundtrack();
  pushMatrix();
  translate(x, y);
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
      rect(i*unitSize, j*unitSize, (i+1)*unitSize, (j+1)*unitSize);
    }
  }
  popMatrix();
  // draw maps here when writen
  
  
  // hover if needs to show hover
  hover();
}


//For hover icon
void hover(){
  // hover if needs to show hover
  if(showHover){
    int newx = mouseX -x; // newx newy for map position in world not screen
    int newy = mouseY -y;
    int mapx = newx/(mapWidth*unitSize); // which map the mouse is on
    int mapy = newy/(mapHeight*unitSize);
    int squarex = newx/unitSize; // which square the mouse is on
    int squarey = newy/unitSize;
    fill(0,0,255);
    pushMatrix();
    translate(x, y);
    //image()// get building.art
    if(selectedBuilding != null){
      image(selectedBuilding.art, squarex*unitSize, squarey*unitSize);
    }
    //rect(squarex*unitSize, squarey*unitSize, squarex*unitSize+unitSize, squarey*unitSize+unitSize); // draw square
    popMatrix();
    noFill();
  }
}

void drawMenu(){
  background(#87ceeb);
  if(!menuSoundTrack.isPlaying()){
    menuSoundTrack.play();
  }
  image(startbutton, width/2-200, 100);
  image(optionsbutton, width/2-200, 300);
  image(exitbutton, width/2-200, 500);
}


//Side bar menu ingame
void drawBuildUI(){
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
  for(building a: buildings){
    if (red(a.mapColor) == buildCategory){
      buildingsInCategory.add(a);
    }
  }
  //Implements an infinit scroll on sub categories
  for(int i = 0; i < 6; i++){
    println(buildCategory, buildingsInCategory.size());
    image(buildingsInCategory.get(abs((subCategoryScroll+i)%buildingsInCategory.size())).art, -200, 100 * (i+1));
  }
  popMatrix();
}

//Cycles through soundtrack
void mainGameSoundtrack(){
  if(loaded){
    if(!gameSoundTrack1.isPlaying() && cycle == 1){
      gameSoundTrack1.play();
    } else if (gameSoundTrack1.percent() >= 98.5){
      cycle += 1;
    }
  }
  if(cycle == 2){
    if(!gameSoundTrack2.isPlaying()){
      gameSoundTrack2.play();
    }else if (gameSoundTrack2.percent() >= 98.5){
      cycle += 1;
    }
  }
  if(cycle == 3){
    if(!gameSoundTrack3.isPlaying()){
      gameSoundTrack3.play();
    }else if (gameSoundTrack3.percent() >= 98.5){
      cycle += 1;
    }
  }
  if(cycle == 4){
    if(!gameSoundTrack4.isPlaying()){
      gameSoundTrack4.play();
    }else if (gameSoundTrack4.percent() >= 98.5){
      cycle += 1;
    }
  }
  if(cycle == 5){
    if(!gameSoundTrack5.isPlaying()){
      gameSoundTrack5.play();
    }else if (gameSoundTrack5.percent() >= 98.5){
      cycle = 1;
    }
  }

}

void drawOptions(){ // put options here :P
  image(exitbutton, width/2-200, 500);
}

void drawProgress(){
  fill(51);
  rect(0, 0, width, 10);
  fill(0, 255, 0);
  rect(0, 0, width*soundLoaded/5, 10);
}
