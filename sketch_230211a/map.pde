class Map{
  PVector miniMapCords;
  PImage mapImage;
  String FILENAME;
  
  Map(int x, int y){
    this.miniMapCords = new PVector(x, y);
    FILENAME = "map/map-"+x+"-"+y+".png";
    try{
      this.mapImage = loadImage(FILENAME);
      this.mapImage.loadPixels();
    }
    catch(Exception e){
      this.mapImage = createImage(10, 10, RGB);
      this.mapImage.save(FILENAME);
    }
  }
  
  void renderMap(){
    
  }
}

Map createMap(int x, int y){
  return new Map(x, y);
}

Map loadMap(int x, int y){
  String fileName = "map/map-"+x+"-"+y+".png";
  try{
    return new Map(x, y);
  }
  catch(Exception e){
    PImage temp = createImage(10, 10, RGB);
    temp.loadPixels();
    for(int i = 0; i < 100; i++){
      temp.pixels[i] = color(0, 0, 0);
    }
    temp.save(fileName);
    return createMap(x, y);
  }
}

void drawMap(Map map){
  if(map != null){
    noFill();
    map.mapImage.loadPixels();
    for(int i = 0; i < mapWidth; i++){
      for(int j = 0; j < mapHeight; j++){
        // draw the building it is
        pushMatrix();
        translate(x+map.miniMapCords.x*500, y+map.miniMapCords.y*500);
        for(building a: buildings){
          rect(j*unitSize, i*unitSize, (j+1)*unitSize, (i+1)*unitSize);
          if(map.mapImage.pixels[i*mapWidth + j] == a.mapColor){
            image(a.art, j*unitSize, i*unitSize);
          }
        }
        popMatrix();
      }
    }
  }
}
