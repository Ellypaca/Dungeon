class Enemy extends GameObject {
  Enemy() {
    loc = new PVector(0, 0);
    vel = new PVector (0, 0);
    //size = 50;
    //hp = 100;
    roomX = 1;
    roomY = 1;
  }

  Enemy (int aichpee, int s, int x, int y) {
    loc = new PVector(random(80, width-80), random(60, height-60));
    while (dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y)<200) {
      loc = new PVector(random(80, width-80), random(60, height-60));
    }
    vel = new PVector (0, 0);
    hp = aichpee;
    size = s;
    roomX = x;
    roomY = y;
  }

  void show() {
    stroke(Black);
    strokeWeight(2);
    fill(Green);
    circle(loc.x, loc.y, size);
    fill(Black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();


    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && roomX == obj.roomX && roomY == obj.roomY) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp-int(obj.vel.mag());
          if (obj.size == 39 ) { //change later
            if (myHero.hp < 130) {
              myHero.hp = myHero.hp+2;
              if (myHero.hp >130) {
                myHero.hp = 130;
              }
            }
          }

        
          //hp = hp - ((Bullet) obj).damage; //downcasting

          obj.hp = 0;
        }
      }

      i++;
    }
  }
}



//Enemy Follower
class Follower extends Enemy {

  Follower(int x, int y) {
    super(100, 50, x, y);
  }

  Follower(int x, int y, float lx, float ly) {
    super(100, 50, x, y);
    loc.x = lx;
    loc.y = ly;
  }

  void show() {
    stroke(Black);
    strokeWeight(2);
    fill(Greyer);
    circle(loc.x, loc.y, size);
    fill(Black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }


  void act() {
    super.act();
    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(3);
  }
}


//untraceable 
class Anventia extends Enemy {

  Anventia (int x, int y) {
    super(10, 50, x, y);
    loc =  new PVector(200, 100);
  }

  void show() {
    noStroke();
    fill(Gray);
    circle(loc.x, loc.y, size);
    fill(Black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();
    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(0.5);

    if (dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= 100) {
      vel.setMag(6);
    }

    if (dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= myHero.size/2 + size/2) {
      hp = 0;
    }
  }
}



//Shade
class Shade extends Enemy {
  Shade(int x, int y) {
    super(30, 50, x, y);
  }

  void show() {
    //vel.setMag(0);

    noStroke();
    fill(Black);
    circle(loc.x, loc.y, size);
    fill(White);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    if (dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= 100) {
      vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      vel.setMag(3);
    }
  }
}



//turret
class Turret extends Enemy {
  int shotTimer;
  int threshold;
  PVector aimVector;

  Turret(int x, int y) {
    super(150, 80, x, y);
    shotTimer = 0;
    threshold = 40;
  }


  void act() {
    super.act();


    shotTimer++;
    if (shotTimer >= threshold) {
      aimVector = new PVector(myHero.loc.x-loc.x, myHero.loc.y-loc.y);
      myObjects.add(new EnemyBullet(loc.x, loc.y, aimVector, Red, 10));
      //myObjects.add(new Bullet(myHero.loc.x, myHero.loc.y, aimVector, Red, 10));

      shotTimer = 0;
    }
  }
}


class Spawner extends Enemy {
  int spawnTimer;
  int threshold; 
  Spawner (int x, int y) {
    super(300, 100, x, y);
    threshold = 150;
  }

  void act() {
    super.act();

    spawnTimer++;
    if (spawnTimer>= threshold) {
      myObjects.add(new Follower(roomX, roomY, loc.x, loc.y));
      spawnTimer = 0;
    }
    
  }
}
