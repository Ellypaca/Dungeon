//Katelynn Bai
//RPG Game
//Oct 20, 2021

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Mode Framework
int mode;
int INTRO = 0;
int GAME = 1;
int PAUSE = 2;
int GAMEOVER = 3;

//BUTTONS
boolean hadPressed;
boolean mouseReleased;

//CONTROLS
boolean wkey, akey, skey, dkey;

//COLOURS
//https://www.colourlovers.com/palette/3115147/Caved_In
color Gray = #A09D86;
color Dark = #2C151E;
color Mauve = #645356;
color Red = #E53B0A;
color Yellow = #E7B855;
color Black = #000000;
color White = #FFFFFF;

//FONTS
PFont USA, USR;

//IMAGES
PImage map;
color northRoom, eastRoom, southRoom, westRoom;

//OBJECTS
//ArrayList <DarknessCell> darkness;
ArrayList<GameObject> myObjects;
Hero myHero;

void setup() {
  size(800, 600, FX2D);

  //Aligns
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  
  //Fonts
  USA = createFont("UnfinishedScreamAlternative.ttf", 50);
  USR = createFont("UnfinishedScreamRegular.ttf", 50);
  
  //Images
  map =  loadImage("New Piskel.png");
  



  //Create Objects
  myHero = new Hero();
  myObjects = new ArrayList<GameObject>(1000);
  myObjects.add(myHero);




  mode = GAME;
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
