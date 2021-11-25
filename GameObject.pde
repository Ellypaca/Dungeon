class GameObject {
  PVector loc; //location
  PVector vel; //velocity
  float size;
  int roomX, roomY;
  boolean ally;
  boolean isCollidingWith;

  color c;
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







    if ( loc.y > height*0.9-size/2) loc.y = height*0.9-size/2;
    if ( loc.y < height*0.1+size/2) loc.y = height*0.1+size/2;
    if ( loc.x > width*0.9-size/2) loc.x = width*0.9-size/2;
    if ( loc.x < width*0.1+size/2) loc.x = width*0.1+size/2;
  } //end act


  //COLLISIONS================
  //in room with
  boolean  inRoomWith(GameObject myObj) {
    if (roomX == myObj.roomX && roomY == myObj.roomY) {
      return true;
    } else {
      return false;
    }
  }


  //is colliding
  boolean isCollidingWith(GameObject myObj) {
    float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
    if (inRoomWith(myObj) && d<size/2 + myObj.size/2) {
      return true;
    } else {
      return false;
    }
  }
}  //end class
