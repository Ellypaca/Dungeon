class Weapon {
  PVector vel;
  int shotTimer, threshold;
  int bulletSpeed;
  PVector loc; //location
  PVector aimVector;

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

      shotTimer = 0;
    }
  }
}


class Bow extends Weapon {
  Bow() {
    super(40, 2);
  }

  void shoot() {
    if (shotTimer >= threshold ) {
      aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new Bullet(myHero.loc.x, myHero.loc.y, aimVector, Red, 10));
      shotTimer = 0;
    }
  }
}

class Mage extends Weapon {
  Mage() {
    super(10, 3);
  }

  void shoot() {
    if (shotTimer >= threshold ) {
      for (int i = 0; i<3; i++) {
        aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
        aimVector.rotate(random(-0.5, 0.5));
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(myHero.loc.x, myHero.loc.y, aimVector, Yellow, 10));
        shotTimer = 0;
      }
    }
  }
}
