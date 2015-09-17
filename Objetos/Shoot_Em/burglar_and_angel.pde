class AngelAndBurglar extends Character {
  PImage[] img = new PImage[3];
  int imageIndex;
  float y;
  int stage; // to check position of characters
  int speed;
  AngelAndBurglar() {
    super();

    for(int i = 0; i < img.length; i++) {
      img[i] = loadImage("enemy" + i + ".gif");
    }
    
    // Positions of characters
    stage = int(random(3));
      if (stage == 0) y = (height-150)/4;
      if (stage == 1) y = (height-50)/2;
      if (stage == 2) y = height-150;
    speed = 4; //character runs at diff. speed 
    imageIndex = (int)random(3);
  }
  
  
  void display() {
    translate(x,y);
    rotate(rot);
    imageMode(CENTER);  
    image(img[imageIndex],0,0);    
    rot+= tilt;
    if (rot > 0.9 || rot < -0.9) { 
      tilt *= -1;
    }
   }    

  
  void move() {
    x+=speed;
  }
  
  //check if our target is aimed at the top half of objects
  boolean onSpot() {
    if (mousePressed && mouseX > x-img[imageIndex].width/2 && mouseX < x+img[imageIndex].width/2
        && mouseY > y-img[imageIndex].height/2 && mouseY < y) {
          return true;
        } else {
          return false;
        } 
  }
}

    
    
