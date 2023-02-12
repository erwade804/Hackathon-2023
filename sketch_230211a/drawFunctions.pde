import processing.sound.SoundFile;

void drawGrid(){ // draw's grid
  if(!gameSoundTrack1.isPlaying() && cycle == 1){
    gameSoundTrack1.rate(1.75);
    gameSoundTrack1.play();
  } else if (gameSoundTrack1.percent() >= 98.5){
    cycle += 1;
  }
  if(!gameSoundTrack2.isPlaying() && cycle == 2){
    gameSoundTrack2.play();
  } else if (gameSoundTrack2.percent() >= 98.5){
    cycle += 1;
  }
  if(!gameSoundTrack3.isPlaying() && cycle == 3){
    gameSoundTrack3.play();
  } else if (gameSoundTrack3.percent() >= 98.5){
    cycle += 1;
  }
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
    rect(squarex*unitSize, squarey*unitSize, squarex*unitSize+unitSize, squarey*unitSize+unitSize); // draw square
    popMatrix();
    noFill();
  }
}

void drawMenu(){
  if(!menuSoundTrack.isPlaying()){
    menuSoundTrack.loop();
  }
  
  
  
}



void drawBuildUI(){
  pushMatrix();
  translate(width, 0);
  fill(72);
  rect(0, 0, -350, height);
  fill(51);
  rect(-300, 50, -50, 20);
  rect(-50, 20, -20, 50, 0, 18, 18, 0);
  rect(-330, 20, -300, 50, 18, 0, 0, 18);
  popMatrix();
}
