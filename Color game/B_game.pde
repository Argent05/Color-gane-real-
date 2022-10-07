void game() {

  //background
  background(255);
  noStroke();
  fill(#616C55);
  rect(0, 0, width/2, height);
  line(width/2, 0, width/2, height);

  fill(255);
  textSize(80);
  textFont(October);
  text("Matches!!", width/4-40, 50);

  fill(#264653);
  textSize(80);
  text("Doesn't Match...", 640, 50);  // how to use width to divide the screen so that the text would be centered on the 3/4th part of the screen

  //moving text
  angle = angle +0.2;
  movingText(400, 400);


  //scoring
  fill(0);
  textSize(40);
  textFont(Baby);
  text("Score: " + score, width/2, 40);
  text("Highscore: " + highscore, width/2, 90);
  text(gamecounter, width/2, height/2+200);

  //gamecounter +textcounter 
  gamecounter = gamecounter - 0.1;
  textcounter = textcounter -0.7;
  
  if (gamecounter < 0) {   // 13

    mode = gameover;
    
  }
}
void movingText(int x, int y) {
  pushMatrix();
  translate(x, y);
  rotate(angle);
  fill(colors[randomColor]);
  textSize(textcounter);
  text(words[randomNum], 30, 30);
  popMatrix();
}

void gameClicks() {

  if (mouseX > 0 && mouseX < width/2 && mouseY >0 && mouseY <800 ) {
    if (randomNum == randomColor) {
      correctResult();
      textcounter = 100;
      gamecounter = 13;
      win.play();
    angle = angle +4;
      win.rewind();
    } else {
      textcounter = 100;
      gamecounter = 13;
      mode = gameover;
      GAME.pause();
      GAME.rewind();
      failure.play();
      akey = false;
      
    }
  }

  if (mouseX > width/2 && mouseX < width && mouseY >0 && mouseY <800) {
    if (randomNum != randomColor) {
      correctResult();
      textcounter = 100;
      gamecounter = 13;
      win.play();
      win.rewind();
      angle = angle +4;
    } else {
      textcounter = 100;
      gamecounter = 13;
      mode=gameover;
      GAME.pause();
      GAME.rewind();
      failure.play();
    }
  }
}

void keyReleased() {
 if (mode == game){
  if (key == 'a' || key == 'A' || keyCode == UP) {
   if (randomNum == randomColor) {
      correctResult();
      textcounter = 100;
      gamecounter = 13;
      win.play();
angle = angle +4;
      win.rewind();
    } else {
      textcounter = 100;
      gamecounter = 13;
      mode = gameover;
      GAME.pause();
      GAME.rewind();
      failure.play();
      akey = false;
    } 
    
  }
  if (key == 'd' || key == 'D' || keyCode == DOWN) {
   if (randomNum != randomColor) {
      correctResult();
      textcounter = 100;
      gamecounter = 13;
      win.play();
      win.rewind();
      angle = angle +4;
    } else {
      textcounter = 100;
      gamecounter = 13;
      mode=gameover;
      GAME.pause();
      GAME.rewind();
      failure.play();
    }
  }
  
  
  
 }
}




void correctResult() {
  score= score+1; // whats the difference between else and else if
  float r= random(0,1);
  if (r <0.5){
  randomNum = (int) random(0, 6);
  randomColor = randomNum;
  
  
}else{
   randomNum = (int) random(0, 6);  // randomize 1 and set it to the other 
   randomColor = (int) random(0, 6);
  
  
  while(randomNum == randomColor){
    randomNum = (int) random(0, 6);  // randomize 1 and set it to the other 
    randomColor = (int) random(0, 6);
   //  r= random(0,1); 
  
 
  
 }
}
  
  
  
}
