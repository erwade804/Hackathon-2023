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

  building(String namecreate, int blengthcreate, int bwidthcreate, PImage artcreate, int yieldcreate, int upkeepcreate, PVector locationcreate, color mapColors){
    name = namecreate;
    blength = blengthcreate;
    bwidth = bwidthcreate;
    art = artcreate;
    yield = yieldcreate;
    upkeep = upkeepcreate;
    location = locationcreate;
    mapColor = mapColors;
  }
  
  void setDescription(String paragraph){
   description = paragraph;
  }
  
  String toString (){
    return("" + this.name + " " + this.blength + " " + this.bwidth + " " + this.yield + " " + this.upkeep + "" + this.mapColor);
  }
}
  
  
