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
  northRoom = map.get(myHero.roomX, myHero.roomY-10);
  eastRoom = map.get(myHero.roomX+10, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+10);
  westRoom = map.get(myHero.roomX-10, myHero.roomY);

  //2: draw
  noStroke();
  fill(Black);
  if (northRoom != White) {
    ellipse(width/2, height*0.1, 100, 100);
  }

  if (eastRoom != White) {
    ellipse (width*0.9, height/2, 100, 100);
  }

  if (southRoom != White) {
    ellipse(width/2, height*0.9, 100, 100);
  }

  if (westRoom != White) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  //floor
  fill(Gray);
  rect(width/2, height/2, width*0.8, height*0.8);

  //image

  image(map, 100, 100, 100, 100);
  fill(Mauve);
  //square(myHero.roomX+10, myHero.roomY+10, 10);
}

void drawGameObjects() {
  //for (int i = 0; i < myObjects.size(); i++; ) {
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.hp <=0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
}


void drawLightLayer() {
}


void drawMiniMap() {
}
