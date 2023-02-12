
void trackTime() {
  if (second() != lastSecondTracked) {
    lastSecondUpdated += 1;
  }
  lastSecondTracked = second();
  if (lastSecondUpdated == 1) {
    tick();
    lastSecondUpdated = 0;
  }
}


void tick() {
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      for (int k = 0; k < 100; k++) {
        maps[i][j].mapImage.loadPixels();
        for (building a : buildings) {
          if (a.mapColor == maps[i][j].mapImage.pixels[k]) {
            if (a.yeildType == 1) {
              if (food > a.upkeep) {
                food -= a.upkeep;
                money += a.yield;
              }
            } else if (a.yeildType == 2) {
              if (money > a.upkeep) {
                food += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 3) {
              if (money > a.upkeep) {
                stone += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 4) {
              if (money > a.upkeep) {
                wood += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 5) {
              if (money > a.upkeep) {
                iron += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 6) {
              if (money > a.upkeep) {
                steel += a.yield;
                money -= a.upkeep;
              }
            } else if (a.yeildType == 7) {
              money += a.yield;
            } else if (a.yeildType == 8) {
              if (money > a.upkeep) {
                planks += a.yield;
                wood -= a.upkeep;
              }
            }
          }
        }
      }
    }
  }
}
