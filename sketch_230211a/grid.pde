

void drawGrid(){
  pushMatrix();
  translate(x, y);
  for(int i = 0; i < width/unitSize; i++){
    for(int j = 0; j < height/unitSize; j++){
      rect(i*unitSize, j*unitSize, (i+1)*unitSize, (j+1)*unitSize);
      if(j > 13 && i > 25){
        println(i*unitSize, j*unitSize, (i+1)*unitSize, (j+1)*unitSize);
      }
    }
  }
  popMatrix();
}
