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
 int price;

  building(String namecreate, int blengthcreate, int bwidthcreate, String artFilePath, int yieldcreate, int upkeepcreate, PVector locationcreate, color mapColors, int price_){
    name = namecreate;
    blength = blengthcreate;
    bwidth = bwidthcreate;
    filePath = artFilePath;
    yield = yieldcreate;
    upkeep = upkeepcreate;
    location = locationcreate;
    mapColor = mapColors;
    art = loadSprite(filePath);
    price = price_;
  }
  
  void setDescription(String paragraph){
   description = paragraph;
  }
  
  String toString (){
    return("" + this.name + " " + this.blength + " " + this.bwidth + " " + this.yield + " " + this.upkeep + "" + this.mapColor);
  }
}

PImage loadSprite(String fileName){ // loads sprite and returns
  try{
    return loadImage("Sprites/"+fileName);
  }
  catch(Exception e){
    return createImage(0, 0, RGB);
  }
}
  
  
