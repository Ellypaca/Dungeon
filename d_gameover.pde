void gameover () {
  fill(Greyer);
  rect(width/2, height/2, width, height);

  fill(Black);
  textFont(USA);
  textSize(80);
  text("You Lost, too bad!", width/2, 200);

  text("Click anywhere to retry", width/2, 400);
}
