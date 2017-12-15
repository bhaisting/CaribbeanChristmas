ArrayList<Firework> fireworks;
int numOfFireworks = 2;
Timer timer;
PImage bg;
PFont font;

void setup(){
  size(800,800);
  bg = loadImage("https://get.wallhere.com/photo/landscape-mountains-digital-art-sea-night-pixel-art-lake-nature-reflection-sky-stars-clouds-Moon-blue-hills-evening-morning-coast-pixels-moonlight-horizon-atmosphere-dusk-cloud-dawn-ocean-wave-darkness-1920x1200-px-computer-wallpaper-wind-wave-630639.jpg");
  bg.resize(800,800);
  font=loadFont("SnellRoundhand-Bold-32.vlw");
  timer = new Timer();
  timer.start();
  fireworks = new ArrayList<Firework>();
  for(int i = 0; i < numOfFireworks; i++){
    fireworks.add(new Firework(random(height), 410));
  }
  textFont(font);
  textSize(88);
}

void draw(){
  image(bg,0,0);
  
  fill(255,0,0);
  text("Happy Hollidays", 100,550);
  for(Firework f : fireworks){
    if(f.isExplode() && !f.exploded){
      f.explode();
    }
    f.show();
  }
  
  //despawn
  for(int i = 0; i < fireworks.size(); i++){
    if(fireworks.get(i).exploded && isDespawn(fireworks.get(i))){
      fireworks.remove(i);
    }
  }
  
  if(timer.intervalPassed(1)){
    spawnFirework();
    timer.start();
  }
    
}

void spawnFirework(){
  fireworks.add(new Firework(random(height), 410));
}

boolean isDespawn(Firework f){
  return (f.particles.get(0).pos.y>2400 || f.particles.get(0).opaque<-200);
}