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
    myHero.lvlpoints--;
  }
  if (Speed.clicked && myHero.lvlpoints > 0) {
    myHero.scap = myHero.scap + 0.5;
    myHero.lvlpoints--;
  }

  fill(Black);
  text("Total Attack: " + (myHero.dmgbonus+myHero.myWeapon.dmg), width/2, height/2-80);
  text("Total Health: " + myHero.hpcap, width/2, int(height/4)+220);
  text("Total Speed: " + myHero.speed, width/2, int(height/4) + 370);






  if (pkey) {
    mode = GAME;
    pkey = false;
  }

  PauseSymbol.show(50);
}
