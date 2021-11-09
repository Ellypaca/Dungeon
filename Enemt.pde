class Enemy extends GameObject {
  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector (0, 0);
    size = 50;
    hp = 100;
    roomX = 1;
    roomY =1;
  }

  void show() {
    stroke(Black);
    strokeWeight(2);
    fill(Green);
    circle(loc.x, loc.y, size);
    fill(Black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    // super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);

        if (d <= size/2 + obj.size/2) {
          hp = hp-int(obj.vel.mag());
          obj.hp = 0;

      }
      }

      i++;
    }
  }
}
