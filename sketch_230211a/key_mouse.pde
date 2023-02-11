

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
