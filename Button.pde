class Button {
  //instance vars
  boolean clicked;
  float x, y, w, h;
  String text;
  color normal, highlight;
  boolean pressed;
  boolean released;

  //constructor
  Button(String t, float _x, float _y, float _w, float _h, color norm, color high) {

    text = t;
    x = _x;
    y = _y; 
    w = _w;
    h = _h;
    normal = norm;
    highlight = high;
  }



  //behaviour
  void show() {

    //button
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY <= y+h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);

    //text label
    textAlign(CENTER, CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY <= y+h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }
    textSize(w/8);
    text(text, x, y);
    released = false;

    if (mousePressed == true) pressed = true; 
    if (mousePressed == false && pressed == true) {
      released = true;
      pressed = false;
    }


    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY <= y+h/2 && released == true) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
