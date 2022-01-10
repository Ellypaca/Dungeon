void mousePressed() {
  if (mode == INTRO) {
    mode = GAME;
  } else if (mode == GAMEOVER){
    mode = INTRO;
    setup();
    draw();
  }
}


void keyPressed() {

  if (key == 'W' || key == 'w') wkey = true; 
  if (key == 'S' || key == 's') skey = true;
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'D' || key == 'd') dkey = true;
  if (key == 'P' || key == 'p') pkey = true;
  if (key == ' ') {
    spacekey = true;
  }
  if (key == 'B' || key == 'b') bkey = true;
  if (key == 'Q' || key == 'q') qkey = true;


  //   if (keyCode == 'SHIFT') shiftkey = true;
}

void keyReleased() {
  if (key == 'W' || key == 'w') {
    wkey = false;
    //myHero.vel.x = 0;
    //myHero.vel.y = 0;
  }
  if (key == 'S' || key == 's') {
    skey = false;
    //myHero.vel.x = 0;
    //myHero.vel.y = 0;
  }
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'D' || key == 'd') dkey = false;
  if (key == 'P' || key == 'p') pkey = false;
  if (key == 'B' || key == 'b') bkey = false;
  if (key == 'Q' || key == 'q') qkey = false;



  if (key == ' ') spacekey = false;
  // if (keyCode == 'SHIFT') shiftkey = false;
}

void buttonStuff() {
  //BUTTON STUFF====================================
  if (mousePressed) hadPressed = true;
  if (hadPressed == true && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (mouseReleased) mouseReleased = false;
}
