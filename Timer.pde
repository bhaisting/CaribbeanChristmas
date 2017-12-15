public class Timer{
  private int prevTime;
  private int currentTime;
  public boolean isTiming = false;
  
  public void start(){
    prevTime = millis();
    isTiming = true;
  }
  
  public boolean intervalPassed(float seconds){
    currentTime = millis();
    if(currentTime - prevTime > seconds * 1000){
      prevTime = currentTime;
      isTiming = false;
      return true;
    }
    return false;
  }
  
}