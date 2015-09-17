class Timer {
  int savedTime;
  int Time1;
  int Time2;
  int totalTime;
  int passedTime;
  
  Timer(){
    Time1 = 500;
    Time2 = 1000;  
  }
  
  void start() {
    savedTime = millis();
    totalTime = int(random(Time1,Time2));
  }
  
  boolean isFinished() {    
    passedTime = millis() - savedTime;
    if (passedTime >= totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
