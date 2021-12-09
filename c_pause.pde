void pause() {
  background(Greyer);
  textSize(60);
  text("Points: " + myHero.lvlpoints, width/2, 40);

  buttonStuff();

  //int i = 0;
  //while (i<myObjects.size()) {
  //  GameObject myObj = myObjects.get(i);
  //  myObj.show();
  //  i++;
  //}

  //for (int n = 0; n < darkness.size(); n++) {
  //  DarknessCell myDark =  darkness.get(n);
  //  myDark.show();
  //}


  Attack.show();
  Health.show();
  Speed.show();



    if (Attack.clicked && myHero.lvlpoints > 0) {
      myHero.dmgbonus = myHero.dmgbonus + 5;
      myHero.lvlpoints--;
    }

    if (Health.clicked && myHero.lvlpoints > 0) {
      myHero.hpcap = myHero.hpcap + 20;
      println(myHero.hpcap, myHero.lvlpoints);
      myHero.lvlpoints--;
    }
    if (Speed.clicked && myHero.lvlpoints > 0) {
      myHero.speed = myHero.speed + 0.5;
      myHero.lvlpoints--;
      println(myHero.speed, myHero.lvlpoints);
    }




  if (pkey) {
    mode = GAME;
    pkey = false;
  }
}
