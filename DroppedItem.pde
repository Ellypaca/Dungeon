class DroppedW extends GameObject {
  int type;
  Weapon w;

  DroppedW(float x, float y, int rx, int ry) {
    type = GUN;
    w = new Wifesteal();
    hp = 1; 
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY= ry;
    c = Yellow;
  }

  void show() {

    //add if to change appearance based off of item type
    stroke(Black);
    strokeWeight(2);
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
