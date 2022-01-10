class Particle extends GameObject {
  int t; //transparency

  Particle(float x, float y, float vx, float vy, int rx, int ry, int s, color clr) {
    hp = 60;
    size = s;
    t = int(random(200, 255));
    loc = new PVector (x, y);
    vel = new PVector(vx, vy);
    vel.rotate(PI+ random(-4, 4)); //I FAILED THIS UNIT AND YOU EXPECT ME TO USE RADIANS 
      
    roomX = rx;
    roomY = ry;
    
    c = clr;
    
  }
  
   void show() {
    noStroke();
    fill(c, t);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();

    t = t - 5;
    if (t <=0) {
      hp = 0;
    }
  }
}
