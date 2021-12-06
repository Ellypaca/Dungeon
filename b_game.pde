void game() {
  frameRate(50);
  drawRoom();
  drawGameObjects();
  //drawLightLayer();
 // drawMiniMap();
  drawInterface();

  //Pause/menu button
  drawPause();
}




void drawRoom() {
  background(Dark);

  //corners
  stroke(0);
  strokeWeight(4);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  //draw exits
  //1: find out which ss have exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);

  //2: draw
  noStroke();
  fill(Black);
  if (northRoom != White) {
    ellipse(width/2, height*0.1, 100, 100);
    image(torch, width/2-58, height*0.05, 50, 50);
    image(torch, width/2+58, height*0.05, 50, 50);
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
  strokeWeight(4);
  stroke(Black);
  rect(width/2, height/2, width*0.8, height*0.8);    //640 and 480

  //floor image
  //80 (8) by 80 (6)
  rectMode(CORNER);
  int x = 120;
  int y = 100;
  for (int i = 0; i < 48; i++) {
    image(floor, x, y);
    x = x + 80;
   if (x >  680){
    x = 120; 
    y = y+80;
   }
    
  }


  image(floor, 680, 100);
  rectMode(CENTER);
}


void drawGameObjects() {
  for (int i = 0; i < myObjects.size(); i++ ) {
    GameObject myObj = myObjects.get(i);
    if (myObj.roomX == myHero.roomX && myObj.roomY == myHero.roomY) {

      myObj.show();
      myObj.act();
      if (myObj.hp <=0) {
        myObjects.remove(i);
        i--;
      }
    }
  }
}


void drawLightLayer() {
  for (int i = 0; i < darkness.size(); i++) {
    DarknessCell myDark =  darkness.get(i);
    myDark.show();
  }
}


void drawMiniMap() {
  rectMode(CORNER);
  //image(map, 100, 100, 100, 100);
  int x = 0;
  int y = 0;
  float size = 10;
  noStroke();
  while (y < map.height) {
    color c  = map.get(x, y);
    if (c != White) c = Black;
    fill(c);
    square(50+x*10, 50+y*10, size);
    x = x+1;

    if (x >= map.width) {
      x= 0;
      y= y+1;
    }
  }

  fill(#FAE630);
  square(50+myHero.roomX*10, 50+myHero.roomY*10, 10);
  rectMode(CENTER);

  x = 0;
  y = 0;
}

void drawPause() {
  if (pkey) {
    mode = PAUSE;
  }
}



void drawInterface() {
  fill(White);
  textSize(60);
  text("HP:"+ myHero.hp, 100, 500);
}
