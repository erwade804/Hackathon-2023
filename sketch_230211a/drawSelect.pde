void drawGame(){
  if(mode == "freeRoam"){
    drawGrid();
    showHover = false;
  }
  else if(mode == "build"){
    drawGrid();
    drawBuildUI();
    showHover = true;
  }
  else if(mode == "mainMenu"){
    drawMenu();
  }
}
