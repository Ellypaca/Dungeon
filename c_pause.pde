void pause(){
  int i = 0;
  while (i<myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    i++;
  }
  
  for (int n = 0; n < darkness.size(); n++) {
    DarknessCell myDark =  darkness.get(n);
    myDark.show();
  }
  
  PauseButton.show();
  
}
