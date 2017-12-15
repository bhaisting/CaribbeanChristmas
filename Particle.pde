public class Particle{
  float rot;
  PVector pos;
  color c;
  int size;
  float Vy;
  float Vx;
  float opaque = 255;
  float rotate;
  
  public Particle(float x, float y){
    pos = new PVector();
    init(x,y);
  }
  
  public Particle(float x, float y, int r, int g, int b){
    pos = new PVector();
    init(x,y);
    c = color(r,b,g);
  }
   
  private void init(float x, float y){
    int r = 255*((int)random(0,2));
    int g = 255*((int)random(0,2));
    int b = 255*((int)random(0,2));
    c =  color(r, g, b);
    float op = random(150,255);
    opaque=(int)random(op,255);
    pos.x = x;
    pos.y = y;
    size = 6;
    rotate=(float)PI/((int)random(32,64));
    Vx = random(-1.5,1.5);
    Vy = random(-2,2) * sqrt(2.25-pow(Vx,2));
    Vx *=2;
    rot=(float)PI/((int)random(1,64));
  }
  
  public void update(){
    pos.x += Vx;
    pos.y += Vy;
    //rot+=PI/64;
    
    rot+=rotate;
    Vy += 0.05; //acceleration
    opaque -= 3;
  }
  
  public void show(){
    fill(c,opaque);
    size = (int) random(1,12);
    ellipse(pos.x, pos.y, size*cos(rot), size);
  }
  
  public float getVelocity(){
    return sqrt(pow(Vx,2) + pow(Vy,2));
  }
}