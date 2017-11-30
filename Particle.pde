public class Particle{
  
  PVector pos;
  color c;
  int size;
  float Vy;
  float Vx;
  float opaque = 255;
  public Particle(float x, float y){
    pos = new PVector();
    init(x,y);
  }
   
  private void init(float x, float y){
    c =  color(random(255), random(255), random(255));
    pos.x = x;
    pos.y = y;
    size = 5;
    
    Vx = random(-7,7);
    Vy = random(-3,1) * sqrt(1-pow(Vx,2));
    Vx *=2;
    //Vy = random(-7, 7);
  }
  
  public void update(){
    pos.x += Vx;
    pos.y += Vy;
    Vy += 0.05; //acceleration
    opaque -= 2;
  }
  
  public void show(){
    fill(c, opaque);
    ellipse(pos.x, pos.y, size, size);
  }
}