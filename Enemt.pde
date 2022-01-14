class Enemy extends GameObject {
  int shotTimer;
  int threshold;
  PVector aimVector;
  float scale;


  Enemy() {
    loc = new PVector(0, 0);
    vel = new PVector (0, 0);
    //size = 50;
    //hp = 100;
    roomX = 1;
    roomY = 1;
    scale = 50;
    textSize(20);
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
    textSize(20);
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
      if (obj instanceof Bullet && isCollidingWith(obj) && hp>0) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp-int(obj.vel.mag() + myHero.dmgbonus);

          if (myHero.myWeapon.WeaponNum == 2) {//obj.size == 39 ) { //change later
            hp = hp-hp%10;

            if (myHero.delaycount > myHero.delay) {
              myHero.hp = myHero.hp+int((0.2*((obj.vel.mag()+ myHero.dmgbonus))));
              myHero.delaycount = 0;
            }
          }




          //hp = hp - ((Bullet) obj).damage; //downcasting
          if (myHero.myWeapon.WeaponNum == 0 || myHero.myWeapon.WeaponNum == 1 ) {
            obj.hp = 0;
          } else if (myHero.myWeapon.WeaponNum == 2 || myHero.myWeapon.WeaponNum == 3 ) {
            obj.hp--;
          }

          if (hp<=0) {
            if (xp != 0 && xp !=500) { //spawned enemies give 0 exp
              myObjects.add(new DroppedW(loc.x, loc.y, roomX, roomY)); 
              myObjects.add(new DroppedHP(loc.x, loc.y, roomX, roomY));
              myObjects.add(new Message (loc.x, loc.y, "+"+xp, 50, roomX, roomY, White, 0.3, 50));

              myHero.xp = myHero.xp + xp;
            }
          }
        }
      }

      i++;
    }
  }
}



//Enemy Follower
class Follower extends Enemy {
  AnimatedGIF FollowerAction;
  float scale;


  Follower(int x, int y) {
    super(FOLLOWER_HP, FOLLOWER_SIZE, x, y);
    scale = 40;

    xp = 5;
    FollowerAction = SkeleLeft;
    c = White;
  }


  Follower(int x, int y, float lx, float ly) {
    super(FOLLOWER_HP-20, FOLLOWER_SIZE, x, y); //make them a bit squishier
    scale  = 50;

    loc.x = lx;
    loc.y = ly;
    FollowerAction = SkeleLeft;
    c = White;

    xp = 0;
  }


  void show() {
    FollowerAction.show(loc.x, loc.y, size/2, size*1.2);


    //bar background
    noStroke();
    fill(White);
    rectMode(CORNER);
    rect(loc.x-20, loc.y-50, 40, 20);


    //health
    fill(BrightGreen);
    rect(loc.x-20, loc.y-50, (scale*hp)/100, 20);
    rectMode(CENTER);

    //text
    fill(Black);
    strokeWeight(2);
    textSize(20);
    text(hp, loc.x, loc.y-40);
  }


  void act() {
    super.act();


    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(FOLLOWER_VEL);

    if (abs(vel.y) > abs(vel.x)) {
      if (vel.y > 0) {
        FollowerAction = SkeleDown;
      } else {
        FollowerAction = SkeleUp;
      }
    } else {
      if (vel.x > 0) {
        FollowerAction = SkeleRight;
      } else {
        FollowerAction = SkeleLeft;
      }
    }
  }
}


//untraceable 
class Anventia extends Enemy {
  AnimatedGIF AnventiaAction;

  Anventia (int x, int y) {
    super(ANVENTIA_HP, ANVENTIA_SIZE, x, y);
    loc =  new PVector(ANVENTIA_LOC_X, ANVENTIA_LOC_Y); //so it doesnt instantly jump you
    xp = 10;
    AnventiaAction = GreenSlime;
    c = Green;
    scale = 400;
  }

  void show() {
    //noStroke();
    //fill(Gray);
    //circle(loc.x, loc.y, size);

    AnventiaAction.show(loc.x, loc.y-8, 1.4*size, 1.4*size);
    noStroke();
    fill(White);
    rectMode(CORNER);
    rect(loc.x-20, loc.y-40, 40, 20);

    fill(Black);
    textSize(20);

    rectMode(CORNER);
    fill(BrightGreen);
    rect(loc.x-20, loc.y-40, (scale*hp)/(100), 20);
    fill(Black);
    text(hp, loc.x, loc.y-30);
    rectMode(CENTER);
  }

  void act() {
    super.act();
    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(0.25);

    if (dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= 100) {
      vel.setMag(6);
      AnventiaAction = RedSlime;
    } else {
      AnventiaAction = GreenSlime;
    }
  }
}



//Shade
class Shade extends Enemy {
  AnimatedGIF currentAction;
  PImage DefaultAction;

  Shade(int x, int y) {
    super(SHADE_HP, SHADE_SIZE, x, y);
    xp = 7;
  }

  void show() {

    noStroke();
    fill(Black);
    circle(loc.x, loc.y, size);
    //fill(White);
    //textSize(20);
    //text(hp, loc.x, loc.y);
    scale = 150;
  }

  void act() {
    super.act();
    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);

    if (dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= 150) {
      noStroke();
      fill(White);
      rectMode(CORNER);
      rect(loc.x-20, loc.y-50, 40, 20);
      textSize(20);
      rectMode(CORNER);
      fill(BrightGreen);
      rect(loc.x-20, loc.y-50, (scale*hp)/100, 20);
      fill(Black);
      text(hp, loc.x, loc.y-40);
      rectMode(CENTER);
      vel.setMag(3);
    } else {
      vel.setMag(0);
    }
  }
}



//turret
class Turret extends Enemy {

  Turret(int x, int y) {
    super(TURRET_HP, TURRET_SIZE, x, y);
    shotTimer = 0;
    threshold = TURRET_THRESHOLD;
    xp = 20;
  }

  void show() {
    stroke(Black);
    strokeWeight(2);
    fill(Steel);
    circle(loc.x, loc.y, size);
    fill(White);
    textSize(20);
    text(hp, loc.x, loc.y);
  }


  void act() {
    super.act();


    shotTimer++;
    if (shotTimer >= threshold) {
      aimVector = new PVector(myHero.loc.x-loc.x, myHero.loc.y-loc.y);
      myObjects.add(new EnemyBullet(loc.x, loc.y, aimVector, Red, 10, false));
      //myObjects.add(new Bullet(myHero.loc.x, myHero.loc.y, aimVector, Red, 10));

      shotTimer = 0;
    }
  }
}


class Spawner extends Enemy {

  Spawner (int x, int y) {
    super(SPAWNER_HP, SPAWNER_SIZE, x, y);
    threshold = SPAWNER_THRESHOLD;
    xp = 30;
  }

  void act() {
    super.act();

    shotTimer++;
    if (shotTimer>= threshold) {
      myObjects.add(new Follower(roomX, roomY, loc.x, loc.y));
      shotTimer = 0;
    }
  }
}

class Dragon extends Enemy {    //boss
  int action;
  int actiontimer;
  int shots, sh;
  int floortimer;

  AnimatedGIF DragonWalk;


  Dragon (int x, int y) {
    super(1000+250*reset, 150, x, y);
    actiontimer = 200;
    threshold = 20;
    xp = 500;
    shots = 25;
    sh = 0;
    floortimer = 90;

    c = Green;

    DragonWalk = DragLeft;
  }

  void show() {
    stroke(Black);
    strokeWeight(3);



    DragonWalk.show(loc.x, loc.y, size, size);


    //healthbar
    rectMode(CORNER);
    fill(White);
    rect(50, 0, (hp*550)/(width+250*reset), 30);
    textSize(30);
    fill(Gray);
    text("Boss HP", width/2, 15);

    rectMode(CENTER);
  }


  void act() {
    super.act();

    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(DRAGON_VEL);

    if (abs(vel.y) > abs(vel.x)) {
      if (vel.y > 0) {
        DragonWalk = DragDown;
      } else {
        DragonWalk = DragUp;
      }
    } else {
      if (vel.x > 0) {
        DragonWalk = DragRight;
      } else {
        DragonWalk = DragLeft;
      }
    }

    if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) <= size/2 + myHero.size/2 + 50) {
      vel.setMag(0);
    }



    if (actiontimer == 400) {
      action = int(random(0, 1));

      switch (action) {
      case 0:
        threshold = 10;
        FireBreath();
        //actiontimer++;

        break;

      case 1: 
        LavaCoat();
     //   actiontimer++;
        break;
      }
    } else {
      actiontimer++;
    }
  }


  void FireBreath() {
    if (shots > 0) {
      shotTimer++;
      if (shotTimer >= threshold) {
        shots--;
        aimVector = new PVector(myHero.loc.x-loc.x, myHero.loc.y-loc.y);
        myObjects.add(new EnemyBullet(loc.x, loc.y, aimVector, Red, 40, true));
        shotTimer = 0;
      }
    } else {
      actiontimer = 0;
      sh++;
      shots = 50 + sh;
    }
  }


  void LavaCoat() {//not working yet
    floortimer--;
    if (floortimer > 0) {
      fill(Red);
      circle(width/2, height/2, 400);
    } else {
      actiontimer = 0;
      floortimer = 300;
    }
  }
}



void healthbar() {
}
