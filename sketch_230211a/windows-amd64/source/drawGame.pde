//Draws game based on mode
void drawGame() {
  if (mode == "freeRoam") {
    drawGrid();
    showHover = false;
    drawResourceText();
  } else if (mode == "build") {
    drawGrid();
    drawBuildUI();
    showHover = true;
    drawResourceText();
    hover();
  } else if (mode == "mainMenu") {
    drawMenu();
    drawProgress();
  } else if (mode == "options") {
    drawOptions();
    drawProgress();
  } else if (mode == "dialog") {
    drawGrid();
    showHover = false;
    drawDialog();
  }
}
