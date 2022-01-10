void intro() {
  background(Dark);
  Elmo.show(width/2, height/2, width, height);

  textFont(USR);
  textSize(100);


  fill(Gray);
  text("Dungeon Game?", width/2+2, 202);
  fill(White);
  text("Dungeon Game?", width/2, 200);
  textFont(USA);

  text("Click anywhere to continue...", width/2, height-50);


  //mode = GAME; //get rid of later
}
