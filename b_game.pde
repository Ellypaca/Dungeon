void game() {
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawMiniMap();
  
  
}




void drawRoom() {
  background(Dark);

  //corners
  stroke(0);
  strokeWeight(4);
  line(0, 0, width, height);
  line(width, 0, 0, height);
  
  //draw exits
  //1: find out which directions have exits
  
  
  

  //floor
  fill(Gray);
  rect(width/2, height/2, width*0.8, height*0.8);
  
  
  
  
}

void drawGameObjects() {
  //for (int i = 0; i < myObjects.size(); i++; ) {
   int i = 0;
   while(i < myObjects.size()){
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.hp <=0) {
      myObjects.remove(i);
    }else{
     i++; 
    }
  }
}


void drawLightLayer() {
}


void drawMiniMap() {
}
