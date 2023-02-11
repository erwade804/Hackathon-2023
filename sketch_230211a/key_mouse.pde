

void keyboardInput(){
  if(keyPressed){
    if(mode == "freeRoam"){
      freeRoamKeyboard();
    } else if (mode == "build"){
      buildModeKeyboard();
    }
  }
}

void mouseInput(){
  if (mode == "freeRoam"){
  
  }
  if (mode == "build"){
    // select build
    // if build selected check price
    // check valid square
    // place building
  }
}




void freeRoamKeyboard(){
  if(key == 'w'){
    y += scrollSpeed;
  }
  else if(key == 's'){
    y -= scrollSpeed;
  }
  else if(key == 'a'){
    x += scrollSpeed;
  }
  else if(key == 'd'){
    x -= scrollSpeed;
  }
}

void buildModeKeyboard(){
  if(key == 'w'){
    y += scrollSpeed;
  }
  else if(key == 's'){
    y -= scrollSpeed;
  }
  else if(key == 'a'){
    x += scrollSpeed;
  }
  else if(key == 'd'){
    x -= scrollSpeed;
  }
}
