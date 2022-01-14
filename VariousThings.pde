//HEALSTATION=================================
class HealStation extends GameObject {
  int timer;
  int storedhp;
  HealStation(int rx, int ry) {
    size = 120;
    roomX = rx;
    roomY = ry;
    hpcap = myHero.hpcap;
    storedhp = 100;
  }

  void show() {
    noStroke();
    fill(Red);
    circle(width/2-size/6, height/2, size/2);
    circle(width/2+size/6, height/2, size/2);

    // fill(Black, 80);
    beginShape();
    vertex(width/2, height/2+60);
    vertex(width/2+2*size/6+8.7, height/2+size/10);
    vertex(width/2+2*size/6+10, height/2);
    vertex(width/2-2*size/6-10, height/2);
    vertex(width/2-2*size/6-8.7, height/2+size/10);
    endShape();
    
    fill(White);
    textSize(50);
    text(storedhp, width/2, height/2+1);


    //fill(Black, 40);
    //rect(width/2, height/2+15, size, size);

    // triangle(width/2-2*size/2, height/2, width/2+2*size/2, height/2, width/2, height/2+size );
  }

  void act() {
    timer++;

    if (timer >= 60) {
      timer = 0;
      storedhp++;
    }

    // println(storedhp);
  }

  void heal() {
    int missinghp = myHero.hpcap - myHero.hp;
    if (myHero.hp < myHero.hpcap && storedhp > 0) {
      //int canberestored = shp.storedhp - missinghp; 
      if (storedhp >= missinghp ) {
        myHero.hp = myHero.hp + int(storedhp);
        storedhp = storedhp - missinghp;
      } else {
        myHero.hp = myHero.hp+storedhp;
        storedhp = 0;
      }
      //shp.storedhp = shp.storedhp-abs(missinghp);
      delaycount = 0;
    }
  }
}

//Shop===========================

class Shopkeeper extends GameObject {

  boolean shopping;
  int timer;
  int t;

  Shopkeeper(int rx, int ry) {
    roomX = rx;
    roomY = ry;
    size = 240;
    timer = 0;
    t = 255;
    loc = new PVector ( 3*width/4, height/2);
    c = #070448;
  }


  void show() {
    if (shopping == false) {
      myObjects.add(new Message (loc.x, loc.y-50, "Shoot me", 50, roomX, roomY, White, 0, 1));
    }


    if (timer  >= 310) {
      myHero.Magus = true;
      t = t-2;
      tint(255, t);
      if (t <= 0) {
        hp = 0;
        shopping = false;
      }
    }
    image(NPC, loc.x, loc.y, 3*size/4, 3*size/4);
    noTint();
  }

  void act() {
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && isCollidingWith(obj)) {
        shopping = true;
      }
    }

    shop();
  }

  void shop() {
    //int sc = myHero.scap;
    if (shopping == true) {
      myHero.DefaultAction = ManR;
      myHero.speed = 0;
      if (timer == 2) {
        myObjects.add(new Message (loc.x, loc.y-100, "We only have one", 50, roomX, roomY, White, 0, 150));
        myObjects.add(new Message (loc.x, loc.y-50, "thing for sale", 50, roomX, roomY, White, 0, 150));
      } else if (timer == 151) {
        myObjects.add(new Message (loc.x, loc.y-100, "Since you're here,", 50, roomX, roomY, White, 0, 150));
        myObjects.add(new Message (loc.x, loc.y-50, "take it for free", 50, roomX, roomY, White, 0, 150));
      } 

      timer++;
    }
  }
}




//TP====================================================
class TP extends GameObject {
  int tping;
  int ogx, ogy;

  TP(int rx, int ry) {
    roomX = rx;
    roomY = ry;

    loc.x = random(width-FLOORX+size/2, FLOORX-size/2);
    loc.y = random(height-FLOORY+size/2, FLOORY-size/2);
    if(roomX == 6 && roomY == 3){
      loc.x = width/4;
      loc.y = height/2;
      
    }
    size = 180;
  }


  void show() {
    portal.show(loc.x, loc.y, size, size);
  }

  void move() {
    if (isCollidingWith(myHero)) {
      tping++;
      fill(0, 0, 80-tping);
      rect(width/2, height/2, width, height);
      if (tping >= 80) {

        if ( !(myHero.roomX == 6) &&  !(myHero.roomY == 3)) {
          myHero.roomX = 6;
          myHero.roomY = 3;
          tping = 0;
        } else {
          myHero.roomX = ogx;
          myHero.roomY = ogy;
        }
      }
    } else {
      tping = 0;
    }
  }


}
