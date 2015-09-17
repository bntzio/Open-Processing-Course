/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/56350*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//import processing.opengl.*;

Character[] character;
AngelAndBurglar[] angelAndBurglar;
Timer timeChar;
EnemyTime enemyTime;
Countdown countdown;
Target target;
PImage bg, start;
PImage[] sideBg = new PImage[4]; //background images
int totalCharacter = 0;
int totalEnemy = 0;
int score = 0;
int level = 1;
boolean gameOver = false;
PFont f;
int bulletCount = 7;
int sideBgIndex = 0;
boolean recharge = false;
int timeOnScreen;
boolean readyToPlay = true;
boolean gameOn = true;

void setup() {
  size(800,480);
  smooth();
  f = loadFont("CordiaNew-Bold-36.vlw");
  bg = loadImage("bg4.gif");
  start = loadImage("Start_Screen.gif");
  //sideBackground images  
  for (int i = 0; i < sideBg.length; i++) {
    sideBg[i] = loadImage("sideBg" + i + ".gif");
  }
  enemyTime = new EnemyTime();
  timeChar = new Timer();
  countdown = new Countdown();
  character = new Character[150];
  angelAndBurglar = new AngelAndBurglar[50];
  target = new Target();
}

void draw() {
  if (readyToPlay) {
    image(start,0,0);
    if (mousePressed) {
      readyToPlay = false;
      countdown.start();
    }
  } else {
  background(bg);
  target.setLocation(mouseX,mouseY); // set target location at mouseX, mouseY
  timeOnScreen = int(countdown.totalTime/1000 - countdown.passedTime/1000);
  
  //check if game is over
  if (gameOver) {
    background(175);
    textFont(f);
    fill(0);
    textAlign(CENTER);
    text("Game Over",width/2, (height - 200)/2);
    text("Play Again",700,430);
    text("Your Score : " + score, width/2, height/2);
    text("Level " + level, width/2, (height - 100)/2);
    gameOn = false;
  }
  //if the game is not over start create character
  else { 
  if (timeChar.isFinished()) {
    character[totalCharacter] = new Character();
    totalCharacter++;
      if(totalCharacter >= character.length){ 
        totalCharacter = 0;
      }
    timeChar.start();
  }
  
  if (enemyTime.isFinished()) {
    angelAndBurglar[totalEnemy] = new AngelAndBurglar();
    totalEnemy++;
      if(totalEnemy >= angelAndBurglar.length) {
        totalEnemy = 0;
      }
    enemyTime.start();
  }
  
    for (int i = 0; i < totalCharacter; i++){        
    pushMatrix();
    character[i].move();
    character[i].display();
    
    //check to see if we click the mouse on the object
    if (bulletCount >= 0 && !recharge){      
         if (character[i].onSpot()){
         character[i].y = -1000; //update y position to off screen         
         score+=200;
         mousePressed = false;   
      }
   }    
   popMatrix();
   }
   
    for (int i = 0; i < totalEnemy; i++){        
    pushMatrix();
    angelAndBurglar[i].move();
    angelAndBurglar[i].display();

    //check to see if we click the mouse on the object
    if (bulletCount >= 0 && !recharge){
         if (angelAndBurglar[i].onSpot()){
         angelAndBurglar[i].y = -1000; //update y position to off screen         
         if (angelAndBurglar[i].imageIndex == 0){
         score+=350; 
         } else 
         if (angelAndBurglar[i].imageIndex == 1){
         score-=250;
         }
         else {
         gameOver = true;
         }
         mousePressed = false;    
      }
   }      
    popMatrix();
   }
    
    //sides background images
    image(sideBg[sideBgIndex],width/2,height/2);
  
   if (countdown.isFinished()){
     totalCharacter = 0; // restart character on each level
     totalEnemy = 0;
     bulletCount = 6;
    if (level == 1 && score > 10000) {
      level = 2;
      sideBgIndex = 1;
      score = 0;
    }else
    if (level == 2 && score > 12000) {
      level = 3;
      sideBgIndex = 2;
      score = 0;
    }else
    if (level == 3 && score > 14000) {
      level = 4;
      sideBgIndex = 3;
      score = 0;
    }else
    if (level == 4 && score > 15000) {
      level = 5;
      score = 0;
    }
    else {
      gameOver = true;
      recharge = false;
    }
    countdown.start();
  }
}

if (gameOn) {
  // display bullets
  for (int i = bulletCount; i >0 ; i--) {
    fill(250,80,50);
    rectMode(CENTER);
    rect(700 - (35*i), height-50, 15,30);
  }
  
  //display gameplay info
      textFont(f);
      fill(0);
      text("Score " + score, 100, height-50);
      text("Level " + level, 250, height-50);
      if (timeOnScreen <= 9){
        textFont(f,50);
        fill(255,0,0);
        text (timeOnScreen,width/2,50);
      } else {
        text("Time: " + timeOnScreen, 370, height - 50);
      }
      target.display(); 
    }
  }
  mousePressed = false; //update mousePressed after mouse has been click!
}

void mousePressed() {
  bulletCount--;
  if (bulletCount < 0) {
    recharge = true;
    bulletCount = 6;
  }
  else {
    recharge = false;
  }  
  if (gameOver == true){
    if (mouseX > 660 && mouseX < 740 && mouseY > 400 && mouseY < 440){  
    gameOver = false;
    countdown.start();
    sideBgIndex = 0;
    totalCharacter = 0;
    totalEnemy = 0;
    bulletCount = 6;
    score = 0;
    level = 1;
    gameOn = true;
   }
  }
}
  

