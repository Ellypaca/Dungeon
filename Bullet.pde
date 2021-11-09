class Bullet extends GameObject {
  int stroke;
  PVector nudge;
  PVector aimVector;
  color colour;
  int damage;

  Bullet() {

    hp = 1;
    stroke = #FFFCFD;
  }

  Bullet(float x, float y, PVector a, int c, int s) {
    loc = myHero.loc.copy();
    aimVector = a;
    size = s;
    colour = c;

    vel =  aimVector.copy();
    //nudge.rotate(PI);
    //nudge.setMag(-30);
    loc.add (vel);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    noStroke();
    fill(colour);
    circle(loc.x, loc.y, size);
  }

  void act() {
    //super.act();
    loc.add(aimVector);
    
    //temp




    if ( loc.y > height*0.9-size/2) hp = 0;
    if ( loc.y < height*0.1+size/2) hp = 0;
    if ( loc.x > width*0.9-size/2) hp = 0;
    if ( loc.x < width*0.1+size/2) hp = 0;
  }
}
