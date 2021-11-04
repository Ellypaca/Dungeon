class Weapon extends GameObject {
  PVector vel;
  PVector aimVector;

  Weapon() {
    shotTimer = 0;
    threshold = 40;
    bulletSpeed = 5; //projectile speed
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
  }

  void shoot() {
    if (shotTimer >= threshold ) {
      aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new Bullet(aimVector, Red, 10));
      println("h");
      shotTimer = 0;
    }
  }
}
