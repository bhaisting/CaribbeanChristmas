public class Firework{
  public PVector pos;
  ArrayList<Particle> particles;
  int numOfParticles = 1000;
  public boolean exploded = false;
  
  public Firework(float x, float y){
    pos = new PVector();
    particles = new ArrayList<Particle>();
    pos.x = x;
    pos.y = y;
  }
  
  public void explode(){
    exploded = true;
    for(int i = 0; i < numOfParticles; i++){
      particles.add(new Particle(pos.x, pos.y));
    }
  }
  
  public void show(){
    if(!exploded){
      fill(255);
      stroke(0);
      rect(pos.x,pos.y,10,25);
      stroke(255,0,0);
      strokeWeight(3);
      line(pos.x+2,pos.y+23,pos.x+8,pos.y+20);
      line(pos.x+2,pos.y+14,pos.x+8,pos.y+11);
      line(pos.x+2,pos.y+5,pos.x+8,pos.y+2);
      noStroke();
      fill(255,0,0);
      triangle(pos.x-2,pos.y,pos.x+12,pos.y,pos.x+5,pos.y-8);
      pos.x -= 0;
      pos.y -= 10;
    }else{
      for(Particle p : particles){
        p.show();
        p.update();
      }
    }
  }
  
}