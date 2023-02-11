void drawGame(){
  if(mode == "freeRoam"){
    drawGrid();
    showHover = false;
  }
  else if(mode == "build"){
    drawGrid();
    showHover = true;
  }
  else if(mode == "mainMenu"){
    drawMenu();
  }
}
