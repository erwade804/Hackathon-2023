class building {
  String name;
  int blength;
  int bwidth;
  PImage art;
  int yield;
  int upkeep;
  PVector location;
  color mapColor;
  String description;
  String filePath;
  //int[6] costarray;
  int price, stonecost, woodcost, ironcost, steelcost, plankcost, happinesscost;

  building(String namecreate, int blengthcreate, int bwidthcreate, String artFilePath, int yieldcreate, int upkeepcreate, PVector locationcreate, color mapColors, int price_, int stone, int wood, int iron, int steel, int plank, int happy) {
    name = namecreate;
    blength = blengthcreate;
    bwidth = bwidthcreate;
    filePath = artFilePath;
    yield = yieldcreate;
    upkeep = upkeepcreate;
    location = locationcreate;
    mapColor = mapColors;
    art = loadSprite(filePath);
    //costarray = costs;
    price = price_;
    stonecost = stone;
    woodcost = wood;
    ironcost = iron;
    steelcost = steel;
    plankcost = plank;
    happinesscost = happy;
  }

  void setDescription(String paragraph) {
    description = paragraph;
  }

  String toString () {
    return("" + this.name + " " + this.blength + " " + this.bwidth + " " + this.yield + " " + this.upkeep + "" + this.mapColor);
  }

  boolean canAfford() {
    println(price <= money, stonecost <= stone, woodcost <= wood, ironcost <= iron, plankcost <= planks);
    if (price <= money && stonecost <= stone && woodcost <= wood && ironcost <= iron && plankcost <= planks) {
      return true;
    }
    return false;
  }

  void subPrice() {
    money -= price;
    stone -= stonecost;
    wood -= woodcost;
    iron -= ironcost;
    planks -= plankcost;
  }
}

PImage loadSprite(String fileName) { // loads sprite and returns
  try {
    return loadImage("Sprites/"+fileName);
  }
  catch(Exception e) {
    return createImage(0, 0, RGB);
  }
}
