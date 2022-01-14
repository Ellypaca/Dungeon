class Message extends GameObject {
  int timer;
  String text;
  float move;

  Message(float x, float y, String t, int s, int rx, int ry, color clr, float m, int tim) {
    loc =new PVector(x, y);
    text = t;
    size = s;
    timer = tim;
    roomX = rx;
    roomY = ry;
    c = clr;
    hp = 1;
    move = m;
    
  }

  void show() {
    textSize(size);
    fill(c);
    text(text, loc.x, loc.y-size);
  }

  void act() {
    loc.y -= move;
    
    
    timer--;
    if (timer <= 0){
      hp = 0;
      timer = 40;
    }
  }
}
