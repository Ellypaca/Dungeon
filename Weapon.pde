class Weapon {
  PVector vel;
  int shotTimer, threshold;
  int bulletSpeed;
  PVector loc; //location
  PVector aimVector;
  int WeaponNum;

  Weapon() {
    shotTimer = 0;
    threshold = 40;
    bulletSpeed = 5; //projectile speed
    loc = new PVector ();
  }

  Weapon (int thr, int bs) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = bs;
  }


  void update() {
    shotTimer++;
  }

  void show() {
    fill(0);

    //triangle(myHero.loc.x, myHero.loc.y, myHero.loc.x, myHero.loc.y-100, myHero.loc.x-100, myHero.loc.y);
  }

  void shoot() {
    if (shotTimer >= threshold ) {
      aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);

      aimVector.setMag(bulletSpeed);
      myObjects.add(new Bullet(myHero.loc.x, myHero.loc.y, aimVector, Red, 10));
      //Bullet = true;


      shotTimer = 0;
    }
  }
}


class Bow extends Weapon {
  Bow() {
    super(BOW_THR, BOW_VEL);
    WeaponNum = 0;
  }

  void shoot() {
    if (shotTimer >= threshold ) {
      aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new Bullet(myHero.loc.x, myHero.loc.y, aimVector, Black, BOW_BULLET_S));
      shotTimer = 0;
    }
  }
}

class Mage extends Weapon {
  Mage() {
    super(MAGE_THR, MAGE_VEL);
  }

  void shoot() {
    if (shotTimer >= threshold ) {
      for (int i = 0; i<3; i++) {
        aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
        aimVector.rotate(random(-0.5, 0.5));
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(myHero.loc.x, myHero.loc.y, aimVector, Yellow, MAGE_BULLET_S));
        shotTimer = 0;
      }
    }
  }
}


//class Sword extends Weapon {
//  Sword(){
//   super() 
//  }



//}


class AOE extends Weapon {
  int r;

  AOE() {
    super(AOE_THR, AOE_VEL);
    r = -10;
    WeaponNum = 1;
  }

  void shoot() {
    if (shotTimer >= threshold ) {

      for (int i = 0; i<15; i++) {
        aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
        aimVector.rotate(radians(r));
        r = r+24;
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(myHero.loc.x, myHero.loc.y, aimVector, Yellow, AOE_BULLET_S));
      }

      shotTimer = 0;
    }
  }
}


class Wifesteal extends Weapon {
  Wifesteal() {
    super(WIFESTEAL_THR, WIFESTEAL_VEL);
    WeaponNum= 2;
  }

  void shoot() {
    if (shotTimer >= threshold ) {
      aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new Bullet(myHero.loc.x, myHero.loc.y, aimVector, Red, WIFESTEAL_BULLET_S));
      shotTimer = 0;
    }
  }
}





//class LB extends Weapon { //literally leblanc


//  LB() {
//    super(0, 100);
//  }

//  void shoot() {
//    if (shotTimer >= threshold ) {
//      aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
//      aimVector.setMag(bulletSpeed);

//      //instead of bullet
//      myHero.loc = new PVector(mouseX, mouseY);
//      //if (dist(myHero.loc.x, myHero.loc.y, Enemy.loc.x, Enemy.loc.y) <= 10){
        
//      //}
      

//      shotTimer = 0;
//    }
//  }
//}
