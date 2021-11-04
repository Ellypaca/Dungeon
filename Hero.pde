class Hero extends GameObject {
  int roomX, roomY;
  float speed;
  PVector direction;

  Weapon myWeapon;

  Hero() {
    super();
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 40.0;
    myWeapon = new Weapon();
    direction = new PVector(0, -0.1);

    //ArrayList<Weapon> Weapons;
    //myWeapon = new Bow();
  }

  void show() {
    fill(Mauve);
    noStroke();
    circle(loc.x, loc.y, size);
  }


  void act() {
    super.act();


    //Up
    if (wkey) vel.y= -speed;

    //Down
    if (skey) vel.y= speed;

    //Left
    if (akey) vel.x= -speed;

    //Right
    if (dkey) vel.x=speed;

    if (!wkey && !skey) vel.y = vel.y*0.75;
    if (!akey && !dkey) vel.x = vel.x*0.75;

    if (vel.mag()> speed) vel.setMag(speed);

    //Check exits
    //north
    if (northRoom != White && loc.y <= height*0.139 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY = roomY - 1;
      loc = new PVector(width/2, height*0.87-10);
    }

    //east
    else if (eastRoom != White && loc.x >= width*0.86 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX = roomX+1;
      loc = new PVector(width*0.2, height/2);
    }

    //south
    else if (southRoom != White && loc.y >= height*0.86 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY = roomY+1; 
      loc = new PVector(width/2, height*0.19-10);
    }

    //west
    else if (westRoom != White && loc.x <= width*0.139 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX = roomX-1;
      loc = new PVector(width*0.85, height/2);
    }

    myWeapon.update();
    if (spacekey) {
      myWeapon.show();
      myWeapon.shoot();
    }
  }
}
