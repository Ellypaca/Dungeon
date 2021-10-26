void intro(){
  background(Dark);
  
  textSize(50);
  text("Intro Screen", width/2, 200);
  
  


  //BUTTON STUFF====================================
  if (mousePressed) hadPressed = true;
  if (hadPressed == true && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (mouseReleased) mouseReleased = false;
  
}
