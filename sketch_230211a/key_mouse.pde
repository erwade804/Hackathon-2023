

void keyPressed(){
  if(keyPressed){
    if(mode == "freeRoam"){
      freeRoamKeyboard();
    } else if (mode == "build"){
      buildModeKeyboard();
    }
  }
}


void mouseClicked(){
  setVolume();
  if (mode == "freeRoam"){
  
  }
  if(mode == "mainMenu"){
    println(mouseX, mouseY);
    if(mouseX>width/2-200 && mouseX < width/2+200){
      if(mouseY > 100 && mouseY < 300){
        if(loaded){
          changeMode("freeRoam");
        }
      }
      if(mouseY > 300 && mouseY < 500){
        changeMode("options");
      }
      if(mouseY > 500 && mouseY < 700){
        stopped = true;
        stop();
      }
    }
  }
  if(mode == "options"){
    if(mouseX > width/2-200 && mouseX < width/2 +200){
      if(mouseY > 500 && mouseY < 700){
        changeMode("mainMenu");
      }
    }
  }
  if (mode == "build"){
    if (mouseX > width-350){
      // now in the overlay
      if(mouseX > width-200 && mouseX < width-150){
        for(int i = 0; i< 6; i++){
          if(mouseY > 100*(i+1) && mouseY < 100*(i+1) + 50){
            // select index i % category size
            ArrayList <building> buildingsInCategory = new ArrayList<building>();
            for(building a: buildings){
              if (red(a.mapColor) == buildCategory){
                buildingsInCategory.add(a);
              }
            }
            selectedBuilding = buildingsInCategory.get(i % buildingsInCategory.size());
          }
        }
      }
    } else{
      
    }
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
  else if(keyCode == UP){
    subCategoryScroll -= 1;
  }
  else if (keyCode == DOWN){
    subCategoryScroll += 1;
  }
  else if (keyCode == RIGHT){
    buildCategory += 1;
    if(buildCategory > maxBuildCategory){
      buildCategory = 0;
    }
  }
  else if (keyCode == LEFT){
    buildCategory -= 1;
    if(buildCategory < 0){
      buildCategory = maxBuildCategory;
    }
  }
}
