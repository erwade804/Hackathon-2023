void changeMode(String newMode) {
  if (mode == "mainMenu" && newMode != "options") {
    mode = newMode;
    menuSoundTrack.stop();
    mode = "dialog";
    return;
  }
  if (newMode == "dialog") {
    savedDialogMode = mode;
    mode = newMode;
  }
  if (mode == "dialog") {
    mode = savedDialogMode;
    savedDialogMode = "freeRoam";
    return;
  }
  mode = newMode;
  //mode = newMode;
  //menuSoundTrack.stop();
  //gameSoundTrack1.stop();
  //gameSoundTrack2.stop();
  //gameSoundTrack3.stop();
  //gameSoundTrack4.stop();
  //gameSoundTrack5.stop();
}

void stopAllMusic() {
  menuSoundTrack.stop();
  gameSoundTrack1.stop();
  gameSoundTrack2.stop();
  gameSoundTrack3.stop();
  gameSoundTrack4.stop();
  gameSoundTrack5.stop();
}

void setVolume() {
  s.volume(volume);
}
