void intro() {
  background(Dark);

  textFont(USA);
  textSize(100);
  text("Intro Screen", width/2, 200);




  //BUTTON STUFF====================================
  if (mousePressed) hadPressed = true;
  if (hadPressed == true && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (mouseReleased) mouseReleased = false;
}
