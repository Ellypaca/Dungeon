void game() {
  frameRate(50);
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawMiniMap();

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
  //1: find out which directions have exits
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
  rect(width/2, height/2, width*0.8, height*0.8);    //640 and 480

  //image

  fill(Mauve);
}


void drawGameObjects() {
  for (int i = 0; i < myObjects.size(); i++ ) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.hp <=0) {
      myObjects.remove(i);
      i--;
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
  int x = 50;
  int y = 50;
  for (int i = 0; i<100; i++) {
    fill(0);



    switch (x) {
    case 50:
      fill(255);
      break;

    case 60:
      if (y == 90 || y == 100)fill(255);
      break;

    case 80:
      if (y == 90 || y == 100)fill(255);
      break;

    case 90:
      if (y >= 80 && y <=110) fill(255);
      break;

    case 100:
      if (y >= 80 && y <=110) fill(255);
      break;


    case 110:
      if (y == 90 || y == 100)fill(255);
      break;

    case 130:
      if (y == 90 || y == 100)fill(255);
      break;


    case 140:
      fill(255);
      break;
    }

    switch (y) {
    case 50:
      fill(255);
      break;

    case 60:
      if (x == 90 || x == 100) fill(255);
      break;

    case 70:
      if (x == 70 || x == 120) fill(255);
      break;

    case 120:
      if (x == 70 || x == 120) fill(255);
      break;

    case 130:
      if (x == 90 || x == 100) fill(255);
      break;


    case 140:
      fill(255);
      break;
    }
    
    // if (myHero.roomX*10+50 == 60 && myHero.roomY*10+50 == 60){
    //  fill(80, 27, 100);
    //}



    square(x, y, 10);
    x=x+10;


    if (x >=150) {
      x = 50;
      y = y+10;
    }
  }
  rectMode(CENTER);
}

void drawPause() {
}
