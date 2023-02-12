void initbuildings () { // all bulidings to memory
  // population
  //buildings.add(new building("shack", 1, 1, "shack.png", 1, 1, null, color(0, 0, 1), [120, 0, 10, 0, 0, 0]));
  buildings.add(new building("shack", 1, 1, "shack.png", 1, 1, null, color(0, 0, 1), 120, 0, 10, 0, 0, 0));
  buildings.get(0).art.resize(50, 50);
  buildings.add(new building("family house", 2, 2, "familyHouse.png", 6, 3, null, color(0, 1, 2), 400, 20, 40, 0, 0, 0));
  buildings.get(1).art.resize(50, 50);
  buildings.add(new building("fancy house", 10, 10, "fancyHouse.png", 15, 6, null, color(0, 2, 3), 1000, 50, 100, 35, 0, 20));
  buildings.get(2).art.resize(50, 50);
  buildings.add(new building("mansion", 10, 10, "mansion.png", 25, 10, null, color(0, 3, 4), 1600, 70, 140, 50, 0, 45));
  buildings.get(3).art.resize(50, 50);
  
  // food
  buildings.add(new building("farm", 10, 10, "farmHouse.png", 1, 0, null, color(1, 0, 1), 150, 0, 20, 0, 0, 0));
  buildings.add(new building("fishing wharf", 10, 10, "fishingWharf.png", 3, 1, null, color(1, 1, 1), 200, 15, 15, 0, 0, 0));
  buildings.get(5).art.resize(50, 50);
  
  
  // resources, not linked
  //buildings.add(new building("stone quarry", 10, 10, "", 5, 2, null, color(2, 0, 1), 200, 0, 10, 15, 0, 0));
  //buildings.add(new building("woodcutters hut", 10, 10, "", 5, 2, null, color(2, 1, 1), 180, 10, 10, 0, 0, 0));
  //buildings.add(new building("logging industry", 10, 10, "", 10, 6, null, color(2, 2, 2), 700, 450, 300, 70, 0, 0));
  //buildings.add(new building("iron mine", 10, 10, "", 5, 4, null, color(2, 3, 1), 300, 15, 10, 0, 0, 0));
  //buildings.add(new building("smeltry", 10, 10, "", 10, 6, null, color(2, 4, 2), 800, 350, 250, 400, 0, 100)));
  //buildings.add(new building("gold mine", 10, 10, "", 5, 4, null, color(2, 5, 1), 150, 15, 0, 15, 0, 0)));
  
  // government buildings
  //buildings.add(new building("town hall", 10, 10, "", 0, 0, null, color(250,0,0)));
  //buildings.add(new building("bank", 10, 10, "", 1, 0, null, color(3, 0, 1), 1500, 250, 0, 150, 30, 50));
  maxBuildCategory = 1;
  
  //Wonder
  buildings.add(new building("presidential Statue", 60, 60, "presidentkiwi.png", 40, 0, null, color(4, 2, 1), 10000, 3000, 3000, 2000, 500, 750);

  //buildings.add(new building("police Station", 10, 10, "", 1, 0, null, color(0, 0, 11)));
  //buildings.add(new building("fire Station", 10, 10, "", 1, 0, null, color(0, 0, 12)));
  //buildings.add(new building("medicial Clinic", 10, 10, "", 1, 0, null, color(0, 0, 13)));
  //buildings.add(new building("hospital", 10, 10, "", 1, 0, null, color(0, 0, 14)));
  //buildings.add(new building("post Office", 10, 10, "", 1, 0, null, color(0, 0, 16)));
  //buildings.add(new building("park Trees", 10, 10, "", 1, 0, null, color(0, 0, 17)));
  //buildings.add(new building("park Fountain", 10, 10, "", 1, 0, null, color(0, 0, 18)));
  //buildings.add(new building("storage Center", 10, 10, "", 1, 0, null, color(0, 0, 19)));
  //buildings.add(new building("warehouse", 10, 10, "", 1, 0, null, color(0, 0, 20)));
  //buildings.add(new building("university", 10, 10, "", 1, 0, null, color(0, 0, 21)));
}
