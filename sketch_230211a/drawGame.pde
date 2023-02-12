//Draws game based on mode 
void drawGame(){
  if(mode == "freeRoam"){
    drawGrid();
    showHover = false;
  }
  else if(mode == "build"){
    drawGrid();
    drawBuildUI();
    showHover = true;
    drawResourceText();
  }
  else if(mode == "mainMenu"){
    drawMenu();
    drawProgress();
  }
  else if(mode == "options"){
    drawOptions();
    drawProgress();
  }
  
}
