class Bullet extends GameObject {
  int stroke;
  PVector nudge;
  boolean ally;
  PVector loc, vel;

  Bullet() {

    hp = 1;
    stroke = #FFFCFD;
    
  }

  Bullet(PVector a, int c, int s) {

    size = s;
    fill(c);
  }

  void show() {

  }

  void act() {
    super.act();
  }
}
