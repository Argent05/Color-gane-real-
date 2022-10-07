void gameover() {
  GAME.play();
  background(#F702DB);
  if (score > highscore){
   highscore = score; 
  }
   textSize(100);
   fill(0);
   text("Score: " + score, width/2,height/2-50);
   text("High Score: " + highscore, width/2,height/2-100);
  
   
   
 fill(255);
  circle(650,650,100);
  textFont(October);
  fill(0);
  textSize(70);
  text("Restart",647,643);
  
  //reset gamecounter and text counter 
  gamecounter = 13;
  textcounter = 100;

  
   
  }
  
  
  
  
  



void gameoverClicks(){
  
  
  if (dist(mouseX, mouseY,650,650)<50){
  mode= intro;
  GAME.pause();
  GAME.rewind();
  
  }
}
