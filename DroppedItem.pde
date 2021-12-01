class DroppedW extends GameObject {
  int type;
  Weapon w;
  int WeaponN;

  DroppedW(float x, float y, int rx, int ry) {
    type = GUN;
    WeaponN = int(random(0, 3));

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
    }

    hp = 1; 
    loc = new PVector(x, y);
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
  }
}

class DroppedHP extends GameObject {
  int type;

  DroppedHP(float x, float y, int rx, int ry) {
    type = HP;
    hp = 1; 
    loc = new PVector(x, y);
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
  }
}
