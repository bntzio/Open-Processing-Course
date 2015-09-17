class Countdown extends Timer {
  int totalTime;

  
  Countdown(){
    super();
    totalTime = 60000;  
  }
  
  void start() {
    savedTime = millis();
  }
  
  boolean isFinished() {
    passedTime = millis() - savedTime;
    if (passedTime >= totalTime){
      return true;
    } else {
      return false;
    }
  }
}
