class Bullet extends GameObject {
  int stroke;
  PVector aimVector;
  color colour;
  int damage;
  int bulletSpeed;

  //weapon specific
  float Arrotate;




  Bullet() {
    hp = 1;
    stroke = #FFFCFD;
    damage = 50;
  }

  Bullet(float x, float y, PVector a, int c, int s) {
    loc = myHero.loc.copy();
    aimVector = a;
    size = s;
    colour = c;
    vel =  aimVector.copy();
    roomX = myHero.roomX;
    roomY = myHero.roomY;

    Arrotate = atan((mouseY-loc.y)/(mouseX-loc.x));
    if (mouseX > loc.x) {
      Arrotate = Arrotate + PI;
    }
  }

  //Enemy bullet
  //Bullet(float x, float y, PVector a, int c, int s, boolean f) {
  //  loc = new PVector(x, y);
  //  vel = a;
  //  bulletSpeed = 5;

  //  vel.setMag(1);
  //  size = s;
  //  colour = c;
  //  ally = false;
  //  roomX = myHero.roomX;
  //  roomY = myHero.roomY;
  //}


  void show() {
    noStroke();
    fill(colour);


    pushMatrix();
    translate(loc.x, loc.y);
    rotate(Arrotate);
    switch (myHero.myWeapon.WeaponNum) {
    case 0:
      image(Arrow, 0, 0, size, size);
      break;

    case 1: 
      image(AOEBullet, 0, 0, size, size);
      break;

    case 2:
      image(LS, 0, 0, size, size);
      break;
      

    case 3:
      image(Arcane, 0, 0, size, size);
      break;
    }
    popMatrix();
  }

  void act() {
    super.act();
    //loc.add(aimVector)

    if (myHero.myWeapon.WeaponNum == 0) {
      vel.mult(1.1);
    }



    if ( loc.y >= height*0.9-size/2) hp = 0;
    if ( loc.y <= height*0.1+size/2) hp = 0;
    if ( loc.x >= width*0.9-size/2) hp = 0;
    if ( loc.x <= width*0.1+size/2) hp = 0;
  }
}



class EnemyBullet extends GameObject {
  int stroke;
  PVector aimVector;
  color colour;
  int damage;
  int bulletSpeed;

  EnemyBullet() {
    hp = 1;
    stroke = #FFFCFD;
    damage = 50;
  }

  EnemyBullet(float x, float y, PVector a, int c, int s) {
    loc = new PVector(x, y);
    aimVector = a;
    size = s;
    colour = c;
    vel =  aimVector.copy();
    vel.setMag(3);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    noStroke();
    fill(colour);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();
    //loc.add(aimVector)

    if ( loc.y >= height*0.9-size/2) hp = 0;
    if ( loc.y <= height*0.1+size/2) hp = 0;
    if ( loc.x >= width*0.9-size/2) hp = 0;
    if ( loc.x <= width*0.1+size/2) hp = 0;
  }
}
