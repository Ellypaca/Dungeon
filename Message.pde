class Message extends GameObject {
  int timer;
  String text;
  float move;

  Message(PVector l, String t, int s, int x, int y, color clr, float m) {
    loc = l.copy();
    text = t;
    size = s;
    timer = 40;
    roomX = x;
    roomY = y;
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
