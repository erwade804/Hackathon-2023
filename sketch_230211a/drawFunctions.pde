import processing.sound.SoundFile;

void drawGrid(){ // draw's grid
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
