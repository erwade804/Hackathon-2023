

void keyboardInput(){
  if(keyPressed){
    if(mode == "freeRoam"){
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
  }
}

void mouseInput(){
  
}
