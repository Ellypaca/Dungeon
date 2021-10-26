class Hero extends GameObject {
  int roomX, roomY;
  float speed;

  Hero() {
    super();
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 40.0;
  }

  void show() {
    fill(Mauve);
    stroke(Black);
    strokeWeight(2);
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
    if (northRoom != White && loc.y == height*0.1 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      println("work");
      roomY--;
      loc = new PVector(width/2, height*0.9-10);
    }

    //east
    if (eastRoom != White && loc.x == width*0.9 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      
    }
    }
  }
