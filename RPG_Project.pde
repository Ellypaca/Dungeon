
//Katelynn Bai
//RPG Game
//Oct 20, 2021

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//settings: items
final int AMMO = 0;
final int MONEY = 1;
final int GUN = 2;
final int HP = 3;

//settings: enemies
final int TURRET_HP = 150;
final int TURRET_SIZE = 100;
final int TURRET_THRESHOLD = 40;

final int SPAWNER_HP = 300;
final int SPAWNER_SIZE = 100;
final int SPAWNER_THRESHOLD = 150;

final int SHADE_HP = 30;
final int SHADE_SIZE = 50;

final int ANVENTIA_HP = 10;
final int ANVENTIA_SIZE = 40;
final int ANVENTIA_LOC_X = 200;
final int ANVENTIA_LOC_Y = 100;

final int FOLLOWER_HP = 100;
final int FOLLOWER_SIZE = 50;
final int FOLLOWER_VEL = 2;

//settings: weapons
final int BOW_THR = 30;
final int BOW_VEL = 35;
final int BOW_BULLET_S = 10;

final int MAGE_THR = 6;
final int MAGE_VEL = 2;
final int MAGE_BULLET_S = 20;

final int AOE_THR = 4;
final int AOE_VEL = 5;
final int AOE_BULLET_S = 20;

final int WIFESTEAL_THR = 40;
final int WIFESTEAL_VEL = 10;
final int WIFESTEAL_BULLET_S = 39;

//settings: hero
final int HP_CAP = 200;
final int XP_CAP = 100;

//final int
//final int
//final int
//final int
//final int
//final int
//final int
//final int
//final int





//Mode Framework
int mode;
int INTRO = 0;
int GAME = 1;
int PAUSE = 2;
int GAMEOVER = 3;

//BUTTONS
boolean hadPressed;
boolean mouseReleased;
Button PauseButton;
Button UnpauseButton;


//CONTROLS
boolean wkey, akey, skey, dkey, spacekey, qkey, ekey, shiftkey, pkey;

//COLOURS
//https://www.colourlovers.com/palette/3115147/Caved_In
color Gray = #A09D86;
color Greyer = #8F938E;
color Dark = #2C151E;
color Mauve = #645356;
color Red = #E53B0A;
color Yellow = #E7B855;
color Black = #000000;
color White = #FFFFFF;
color Green = #76B26E;
color BrightGreen = #3EE807;
color Gold = #F7C90C;
color Steel = #908D8A;
color mapPink = #ff00f2;
color mapRed = #fa0000;
color mapYellow = #fee606;
color mapPurple = #621262;
color mapGreen = #2d8e2a;
color mapBlue = #1209f8;

//FONTS
PFont USA, USR;

//IMAGES
PImage  map;
color northRoom, eastRoom, southRoom, westRoom;
//Room colours: #fa0000 (red), #fee606 (yellow), #621262 (purple), #1209f8 (dark blue), #2d8e2a (green)

PImage floor;


//GIFS
//MAN
AnimatedGIF manUp, manDown, manRight, manLeft;
PImage ManU, ManD, ManR, ManL;

//ENEMY
AnimatedGIF SkeleUp, SkeleDown, SkeleRight, SkeleLeft;


//SPRITES
PImage torch;

//OBJECTS
ArrayList<GameObject> myObjects;
Hero myHero;
//final int 


//DARKNESS
ArrayList <DarknessCell> darkness;
DarknessCell myDark;

//testing
float acc; 




void setup() {
  size(800, 600, FX2D); //640, 480

  //Aligns
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  //Fonts
  USA = createFont("UnfinishedScreamAlternative.ttf", 50);
  USR = createFont("UnfinishedScreamRegular.ttf", 50);

  //Buttons
  PauseButton = new Button("Click here to resume", width/2, 300, 300, 100, Black, White );

  //Images
  map =  loadImage("Enemy Map.png");
  floor = loadImage("Floor.png");

  //GIFs==========================
  //HERO
  manUp = new AnimatedGIF(4, 10, "data/Hero/_up/hero_up_", ".png");
  manRight = new AnimatedGIF(4, 10, "data/Hero/_right/hero_right_", ".png");
  manLeft = new AnimatedGIF(4, 10, "data/Hero/_left/hero_left_", ".png");
  manDown = new AnimatedGIF(4, 10, "data/Hero/_down/hero_down_", ".png");
  ManU = loadImage("data/Hero/_up/hero_up_0.png");
  ManR = loadImage("data/Hero/_right/hero_right_0.png");
  ManL = loadImage("data/Hero/_left/hero_left_0.png");
  ManD = loadImage("data/Hero/_down/hero_down_0.png");
  //ENEMY

  //FOLLOWER
  SkeleUp = new AnimatedGIF(4, 10, "data/skeleton/SkeleUp/Skeleton_", ".png");
  SkeleDown = new AnimatedGIF(4, 10, "data/skeleton/SkeleDown/Skeleton_", ".png");
  SkeleLeft = new AnimatedGIF(4, 10, "data/skeleton/SkeleUp/Skeleton_", ".png");
  SkeleRight = new AnimatedGIF(4, 10, "data/skeleton/SkeleRight/Skeleton_", ".png");





  //Sprites
  torch = loadImage("SmallTorch.png");

  //Create Objects
  myHero = new Hero();
  myObjects = new ArrayList<GameObject>(1000);
  myObjects.add(myHero);






  //Create Darkness
  float size = 10.0;
  darkness = new ArrayList<DarknessCell>(1000);
  rectMode(CORNER);
  float x = 0.0, y = 0.0; 
  for (int i = 0; i<(width*height)/size; i++) {
    darkness.add(new DarknessCell(x, y, size));
    x = x + size;
    if (x >= width+size) {
      x = 0;
      y = y + size;
    }
  }
  rectMode(CENTER);


  //test

  mode = INTRO; //INTRO

  //loading enemies from  map===============
  int xx = 0;
  int yy = 0;
  while (yy < map.height) {
    color roomColour  = map.get(xx, yy);


    if (roomColour == mapPink) {            //starting room
      myObjects.add(new Follower(xx, yy));
    }


    if (roomColour == mapRed) {          //normal room
      int a = int(random(1, 5));
      for (int n = 0; n<a; n++) {
        myObjects.add(new Follower(xx, yy));
      }
      myObjects.add(new Anventia(xx, yy));
      myObjects.add(new Shade(xx, yy));
    }

    if (roomColour == mapYellow) {      //treasure room
      myObjects.add(new Turret(xx, yy));
      myObjects.add(new Turret(xx, yy));
      myObjects.add(new Spawner(xx, yy));
      myObjects.add(new Anventia(xx, yy));
    }

    if (roomColour == mapGreen) {        //health room
      myObjects.add(new Anventia(xx, yy));
      myObjects.add(new Shade(xx, yy));
      myObjects.add(new Shade(xx, yy));
      myObjects.add(new Shade(xx, yy));
    }

    if (roomColour == mapPurple) {        //challenge or puzzle room
      myObjects.add(new Anventia(xx, yy));
      myObjects.add(new Anventia(xx, yy));
      myObjects.add(new Anventia(xx, yy));


      myObjects.add(new Spawner(xx, yy));
      myObjects.add(new Spawner(xx, yy));
    }


    if (roomColour == mapBlue) {        //final boss room
      myObjects.add(new Dragon(xx, yy));
    }




    xx++;
    if (xx == map.width) {
      xx= 0;
      yy++;
    }
  }
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode =" + mode);
  }
}
