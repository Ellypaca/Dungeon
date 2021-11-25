class Particle extends GameObject {
  int t; //transparency

  Particle(float x, float y, float vx, float vy) {
    hp = 60;
    size = 8;
    t = int(random(200, 255));
    int i = 0;
    loc = new PVector (x, y);
    vel = new PVector (vx, vy);
    vel.rotate(PI+ random(-4, 4));




    //while (i<7) {
    //  GameObject myObj = myObjects.get(i);
    //  location = new PVector (x, y);
    //}
  }
}
