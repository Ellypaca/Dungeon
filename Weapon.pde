class Weapon extends GameObject {
  PVector vel;
  PVector aimVector;

  Weapon() {
    shotTimer = 0;
    threshold = 40;
    bulletSpeed = 5; //projectile speed
   lloc = new PVector ();
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
    rect(myHero.loc.x, myHero.loc.y+25, 10, 50);
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


class Bow extends GameObject {
  Bow(){
    
  }
}
