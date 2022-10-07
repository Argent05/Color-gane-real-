import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//keys

boolean akey,dkey,upkey,downkey;

//Minim 
Minim minim;
AudioPlayer GAME, win, failure;

//puzzle variables


int mode;
final int intro = 1;
final int game = 2;     // final means lock th variable, cant change
final int pause = 3 ;
final int gameover= 4;

int randomNum = (int) random(0,6);
int randomColor = (int) random(0,6);
float r = (float) random(0,1);

color red = #ff0000;
color green = #00ff00;
color blue = #0000ff;
color orange = #FF7D03;
color yellow = #F6FF03;
color black =#080808;

String[] words = {"RED", "GREEN", "BLUE", "ORANGE","YELLOW","BLACK"};    // Add bomb? 
color[] colors = {red,green,blue,orange,yellow,black};
//font
PFont October;
PFont Baby;

// gif initalization 
PImage[] gif;
int frames;
int f;

//text initaliziation +text movement
float angle;

//scoring
int score;
int highscore;

//counter
int counter;
float gamecounter;
float textcounter;

void setup () {
  size(800,800);
  mode = intro;
  textAlign(CENTER,CENTER);
  
   frames = 30;
  gif = new PImage[frames];
  
   int i = 0;
  while ( i < frames) {
    gif[i] = loadImage("frame_"+ i+ "_delay-0.07s.gif");
    i++;  
  }
  
 October = createFont("October Rose.otf",100);
 Baby = createFont("Baby Doll.otf",40); // the number is the smallest font size? or base text size value
  
  angle = 0;
  
  
  
  //scoring initalization
  score = 0;
  highscore = 0;
  
  //music variables 
  
  minim = new Minim(this);
  win = minim.loadFile("SUCCESS.wav");
  GAME = minim.loadFile("MUSIC.mp3");
  failure = minim.loadFile("FAILURE.wav");
  
  //counter initalziation
  counter= 0;
  gamecounter = 13;
  textcounter = 100;
}


void draw() {
  
  
  
  
  
 
  
  
  
  
  
  //modeframework code 
  
  if (mode == intro) {
    intro();
  }else if (mode == game) {
  game();
  } else if (mode == gameover) {
    gameover();
  } else{
    println("Error: Mode = " + mode);
   
  }
  
}


boolean touchingRect(int x, int y, int w, int h){
 if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
   return true;
 }else {
   return false;
 }
}
 boolean touchingCircle(int x, int y, int r ){

  if (dist(x,y,mouseX, mouseY)<r) {
    return true;
  }else{
   return false;
  }
  
  
}
  
