class GameObject {
  PVector loc; //location
  PVector vel; //velocity
  float size;
  int roomX, roomY;
  boolean ally;


  int hp, shield;


  GameObject() {
    loc = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    hp = 100;
  }

  void show() {
  }

  void  act() {
    loc.add(vel);
    
    //COLLISIONS================
    
    
    

    if ( loc.y > height*0.9-size/2) loc.y = height*0.9-size/2;
    if ( loc.y < height*0.1+size/2) loc.y = height*0.1+size/2;
    if ( loc.x > width*0.9-size/2) loc.x = width*0.9-size/2;
    if ( loc.x < width*0.1+size/2) loc.x = width*0.1+size/2;
  }
}
