class DroppedW extends GameObject {
  int type;
  Weapon w;
  int WeaponN;

  DroppedW(float x, float y, int rx, int ry) {
    type = GUN;
    if (myHero.Magus == true) {
      WeaponN = int(random(0, 4));
    } else {
      WeaponN = int(random(0, 3));
    }

    switch (WeaponN) {
    case 0:
      w = new Bow();
      break;

    case 1:
      w = new AOE();
      break;

    case 2:
      w = new Wifesteal();
      break;

    case 3:
      if (myHero.Magus == true) {
        w = new Mage();
      }
      break;

      //case 4:
      //  w = new Pierce();
      //  break;
    }

    hp = 1; 
    pushx = random(-100, 100);
    pushy = random(-100, 100);

    loc = new PVector(x+pushx, y+pushy);
    vel = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY= ry;
  }

  void show() {

    //add if to change appearance based off of item type
    stroke(Black);
    strokeWeight(2);
    c = Yellow;

    fill(c);
    circle(loc.x, loc.y, size);
  }


  void act() {
    super.act();
  }
}

class DroppedHP extends GameObject {
  int type;

  DroppedHP(float x, float y, int rx, int ry) {
    type = HP;
    hp = 1; 

    pushx = random(-50, 50);
    pushy = random(-50, 50);

    loc = new PVector(x+pushx, y+pushy);
    vel = new PVector(0, 0);
    size = 40;
    roomX = rx;
    roomY= ry;
    c = White;
  }

  void show() {

    //add if to change appearance based off of item type
    stroke(Black);
    strokeWeight(2);
    fill(c);
    circle(loc.x, loc.y, size);
    fill(Red);
    noStroke();
    rect(loc.x, loc.y, 5, 20);
    rect(loc.x, loc.y, 20, 5);
  }


  void act() {
    super.act();
  }
}
