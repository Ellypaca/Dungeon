class Hero extends GameObject {
  boolean invincible;
  int invinTimer;
  color clr;
  AnimatedGIF currentAction;
  PImage DefaultAction;
  int lvlpoints;

  Weapon myWeapon;

  Hero() {
    super();
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 40.0;
    myWeapon = new AOE(); //Bow, mage, AOE, wifesteal
    clr= BrightGreen;
    invinTimer = 60;
    currentAction = manDown;
    DefaultAction = ManU;
    lvlpoints = 5;


    hpcap = HP_CAP;
    hp = 100;


    //other stuff
    delay = 0.2;
    delaycount = 0;
    dmgbonus = 0;

    //EXP
    lvlpoints = 5;
    xpcap = XP_CAP;


    //ArrayList<Weapon> Weapons;
    //myWeapon = new Bow();
  }

  void show() {
    fill(clr);
    noStroke();
    //circle(loc.x, loc.y, size);

    if (vel.mag()>0.1) {
      currentAction.show(loc.x, loc.y, size, size*2);
    } else {
      image(DefaultAction, loc.x, loc.y, size, size*2);
    }


    //HEALTH======================
    if (hp>hpcap) {
      hp = hpcap;
    }
    fill(Black);
    rectMode(CORNER);

    rect(loc.x-20, loc.y-40, 40, 10);
    if (hp >= hpcap/4)    clr = BrightGreen;
    if (hp <= hpcap/5) clr = mapYellow;
    if (hp <= hpcap/7) clr = Red;
    if (invincible) clr = Gold;
    fill(clr);
    rect(loc.x-20, loc.y-40, (40*hp)/100, 10);

    //SHIELDS
    if (hp > hpcap/2) {
      shield = hpcap - hp;
    }

    //fill(White);
    //rect(loc.x-20, loc.y-40, (40*hp)/100, 10);

    rectMode(CENTER);
  }


  void act() {
    super.act();


    if (xp >= xpcap) {
      xpcap = xpcap + 5; 
      xp = 0;
      lvlpoints++;
      level++;
    }

    //testing 
    if (bkey) {
      roomX = 4;
      roomY = 3;
    }



    //MOVEMENT=======================================
    //Up
    if (wkey) vel.y= -speed;
    //Down
    if (skey) vel.y= speed;
    //Left
    if (akey) vel.x= -speed;
    //Right
    if (dkey) vel.x=speed;


    //slide
    if (!wkey && !skey) vel.y = vel.y*0.75;
    if (!akey && !dkey) vel.x = vel.x*0.75;

    //not too fast
    if (vel.mag()> speed) vel.setMag(speed);

    //Action
    if (abs(vel.y) > abs(vel.x)) {
      if (vel.y > 0) {
        currentAction = manDown;
      } else {
        currentAction = manUp;
      }
    } else {
      if (vel.x > 0) {
        currentAction = manRight;
      } else {
        currentAction = manLeft;
      }
    }

    if (vel.mag() <= 0.1) {
      if (currentAction == manUp) DefaultAction = ManU;
      if (currentAction == manDown) DefaultAction = ManD;
      if (currentAction == manLeft) DefaultAction = ManL;
      if (currentAction == manRight) DefaultAction = ManR;
    }


    //Check exits
    //north
    if (northRoom != White && loc.y <= height*0.18-size/2 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY = roomY - 1;
      loc = new PVector(width/2, height*0.85);
    }

    //east
    else if (eastRoom != White && loc.x >= width*0.85+size/4 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX = roomX+1;
      loc = new PVector(width*0.13, height/2);
    }

    //south
    else if (southRoom != White && loc.y >=height*0.85+size/4 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY = roomY+1; 
      loc = new PVector(width/2, height*0.18);
    }

    //west
    else if (westRoom != White && loc.x <= width*0.13 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX = roomX-1;
      loc = new PVector(width*0.83, height/2);
    }

    myWeapon.update();
    if (spacekey) {
      myWeapon.show();
      myWeapon.shoot();
    }




    //BUFFS
    invincible();

    //DELAYS========
    //healing delay
    delaycount = delaycount + 0.05;



    //TAKING DAMAGE
    int i = 0;
    while (i<myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Enemy || myObj instanceof EnemyBullet) {
        //if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size/2 +10
        //  && roomX == myObj.roomX && roomY == myObj.roomY) {
        if (isCollidingWith(myObj)) {

          if (invincible == false && !(myObj instanceof Spawner) && !(myObj instanceof Turret)) {
            if (myObj instanceof Follower) hp = hp - 10;  //clean up later
            if (myObj instanceof Anventia) {
              hp = hp - 40;
              myObj.hp = 0;
            }

            if (myObj instanceof EnemyBullet) {
              hp = hp - 5; 
              myObj.hp = 0;
            }


            if (myObj instanceof Shade) {
              hp = hp - 20;
            }

            clr = Gold;
            invincible = true;
          }
        }
      }

      //PICKING UP THINGS=============
      if (myObj instanceof DroppedW && isCollidingWith(myObj)) {
        DroppedW wpn = (DroppedW) myObj;
        //if (wpn.type == GUN) {
        myWeapon = wpn.w;
        wpn.hp = 0;
        //}
      }

      //HEALING======================
      if (myObj instanceof DroppedHP && isCollidingWith(myObj)) {
        DroppedHP HP = (DroppedHP) myObj;
        HP.hp = 0;
        if (delaycount >= delay) {
          hp= hp+10;
          delaycount = 0;
        }
      }

      if (myObj instanceof HealStation && isCollidingWith(myObj)) {
        HealStation shp = (HealStation) myObj;
        shp.heal();
      }






      i++;
    }





    //DYING
    if (hp <=0) {
      mode = GAMEOVER;
    }
  }





  void invincible() {
    if (myHero.invincible) {
      if (myHero.invinTimer == 0) {
        myHero.invinTimer = 60;
        myHero.clr = BrightGreen;
        myHero.invincible = false;
      }
      myHero.invinTimer--;
    }
  }
}
