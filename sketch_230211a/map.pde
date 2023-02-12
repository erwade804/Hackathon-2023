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
  map.mapImage.loadPixels();
  for(int i = 0; i < mapWidth; i++){
    for(int j = 0; j < mapHeight; j++){
      // draw the building it is
      for(building a: buildings){
        println(a.mapColor);
        //if(map.mapImage.pixels[i*mapWidth][j] == a.mapColor){
        //}
        a.art.resize(50, 50);
        image(a.art, i*mapWidth, i*mapHeight);
      }
    }
  }
}
