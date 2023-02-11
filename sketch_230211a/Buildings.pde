void initbuildings () { // all bulidings to memory
  // population
  buildings.add(new building("shack", 1, 1, "shack.png", 1, 0, null, color(0, 0, 1)));
  buildings.add(new building("family house", 2, 2, "familyHouse.png", 1, 0, null, color(0, 0, 2)));
  buildings.add(new building("fancy house", 10, 10, "", 1, 0, null, color(0, 0, 3)));
  buildings.add(new building("mansion", 10, 10, "", 1, 0, null, color(0, 0, 4)));
  
  // food
  buildings.add(new building("fishing wharf", 10, 10, "", 1, 0, null, color(0, 1, 1)));
  // not linked
  buildings.add(new building("farms", 10, 10, "", 1, 0, null, color(0, 2, 1)));
  
  // resources, not linked
  buildings.add(new building("stone quarry", 10, 10, "", 1, 0, null, color(0, 3, 1)));
  buildings.add(new building("lumber mill", 10, 10, "", 1, 0, null, color(0, 4, 1)));
  buildings.add(new building("logging industry", 10, 10, "", 1, 0, null, color(0, 4, 2)));
  buildings.add(new building("iron mine", 10, 10, "", 1, 0, null, color(0, 5, 1)));
  buildings.add(new building("smeltry", 10, 10, "", 1, 0, null, color(0, 5, 2)));
  buildings.add(new building("gold mine", 10, 10, "", 1, 0, null, color(0, 6, 1)));
  
  // government buildings
  buildings.add(new building("bank", 10, 10, "", 1, 0, null, color(0, 7, 1)));

  //buildings.add(new building("policeStation", 10, 10, "", 1, 0, null, color(0, 0, 11)));
  //buildings.add(new building("fireStation", 10, 10, "", 1, 0, null, color(0, 0, 12)));
  //buildings.add(new building("medicialClinic", 10, 10, "", 1, 0, null, color(0, 0, 13)));
  //buildings.add(new building("hospital", 10, 10, "", 1, 0, null, color(0, 0, 14)));
  //buildings.add(new building("townHall", 10, 10, "", 1, 0, null, color(0, 0, 15)));
  //buildings.add(new building("postOffice", 10, 10, "", 1, 0, null, color(0, 0, 16)));
  //buildings.add(new building("parkTrees", 10, 10, "", 1, 0, null, color(0, 0, 17)));
  //buildings.add(new building("parkFountain", 10, 10, "", 1, 0, null, color(0, 0, 18)));
  //buildings.add(new building("storageCenter", 10, 10, "", 1, 0, null, color(0, 0, 19)));
  //buildings.add(new building("warehouse", 10, 10, "", 1, 0, null, color(0, 0, 20)));
  //buildings.add(new building("university", 10, 10, "", 1, 0, null, color(0, 0, 21)));
}
