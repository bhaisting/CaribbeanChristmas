Firework gg;
ArrayList<Firework> fireworks;
void setup(){
  size(800,800);
  fireworks = new ArrayList<Firework>();
  for(int i = 0; i < 5; i++){
    fireworks.add(new Firework(random(height), width));
  }
}

void draw(){
  background(255);
  for(Firework f : fireworks){
    if(f.pos.y <= 400 && !f.exploded){
    f.explode();
    }
    f.show();
  }
}