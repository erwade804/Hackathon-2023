void changeMode(String newMode){
  if(mode == "mainMenu" && newMode != "options"){
   menuSoundTrack.stop(); 
  }
  mode = newMode;
  //menuSoundTrack.stop();
  //gameSoundTrack1.stop();
  //gameSoundTrack2.stop();
  //gameSoundTrack3.stop();
  //gameSoundTrack4.stop();
  //gameSoundTrack5.stop();
}

void stopAllMusic(){
  menuSoundTrack.stop();
  gameSoundTrack1.stop();
  gameSoundTrack2.stop();
  gameSoundTrack3.stop();
  gameSoundTrack4.stop();
  gameSoundTrack5.stop();
}

void setVolume(){
  s.volume(volume);
}
