

void drawGrid(){
  pushMatrix();
  translate(x, y);
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
      rect(i*unitSize, j*unitSize, (i+1)*unitSize, (j+1)*unitSize);
      //println(i*unitSize, j*unitSize, (i+1)*unitSize, (j+1)*unitSize);
    }
  }
  popMatrix();
}
