class DarknessCell{
  float opacity;
  float x, y, size;
  float d;
  
  DarknessCell(float _x, float _y, float s){
    size = s;
    x=_x;
    y=_y;
    opacity = 0;
  }
  
  void show(){
    d = dist(myHero.loc.x, myHero.loc.y, x, y);
    opacity = map(d, 0.0, 200.0, -20, 140);
    
    
    
    //stroke(Black);
    noStroke();
    fill(Black, opacity);
    square(x, y, size);
  }
  
}
