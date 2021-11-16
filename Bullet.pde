class Bullet extends GameObject {
  int stroke;
  PVector nudge;
  PVector aimVector;
  color colour;
  int damage;
  int bulletSpeed;

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
    //loc.add (vel);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    ally = true;
  }

  //Enemy bullet
  Bullet(float x, float y, PVector a, int c, int s, boolean f) {
    loc = new PVector(500, 100);
    aimVector = a;
    aimVector.setMag(5);
    bulletSpeed=5;
    vel =  aimVector.copy();
    size = s;
    colour = c;
    ally = f;
  }


  void show() {
    noStroke();
    fill(colour);
    circle(loc.x, loc.y, size);
    println(loc.x, loc.y);
  }

  void act() {
    super.act();
    loc.add(aimVector);




    if ( loc.y >= height*0.9-size/2) hp = 0;
    if ( loc.y <= height*0.1+size/2) hp = 0;
    if ( loc.x >= width*0.9-size/2) hp = 0;
    if ( loc.x <= width*0.1+size/2) hp = 0;
  }
}
