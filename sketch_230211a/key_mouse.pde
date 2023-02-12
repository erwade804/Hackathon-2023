

void keyPressed() { // keyboard mode select switch
  if (keyPressed) {
    if (mode == "freeRoam") {
      freeRoamKeyboard();
    } else if (mode == "build") {
      buildModeKeyboard();
    }
  }
}


void mouseClicked() {
  setVolume();
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




void freeRoamKeyboard() { // keyboard checks for free roam
  if (key == 'w') {
    y += scrollSpeed;
  } else if (key == 's') {
    y -= scrollSpeed;
  } else if (key == 'a') {
    x += scrollSpeed;
  } else if (key == 'd') {
    x -= scrollSpeed;
  }
}

void buildModeKeyboard() { // keyboard checks for build mode
  if (key == 'w') {
    y += scrollSpeed;
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


void freeRoamMouse() {
}


void mainMenuMouse() {
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

void optionsMouse() {
  if (mouseX > width/2-200 && mouseX < width/2 +200) { // button x range
    if (mouseY > 500 && mouseY < 700) { // button y range
      changeMode("mainMenu"); // change to main menu
    }
  }
}

void buildMouse() {
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
      int newx = mouseX-x; // newx newy for map position in world not screen
      int newy = mouseY-y;
      int mapx = newx/(mapWidth*unitSize); // which map the mouse is on
      int mapy = newy/(mapHeight*unitSize);
      int squarex = newx/unitSize%mapWidth; // which square the mouse is on
      int squarey = newy/unitSize%mapHeight;
      maps[mapx][mapy].mapImage.loadPixels();
      maps[mapx][mapy].mapImage.pixels[squarey*mapWidth + squarex] = selectedBuilding.mapColor;
    }
  }
  // select build
  // if build selected check price
  // check valid square
  // place building
}
