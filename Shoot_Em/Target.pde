class Target {
  PImage aimer;
  float x,y; //location of target
  
  Target() {
    aimer = loadImage("target.gif");
    this.x = 0;
    this.y = 0;
  }
  
  void setLocation(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    translate(mouseX,mouseY);
    imageMode(CENTER);
    image(aimer,0,0,70,70);
  }
  
}
  
