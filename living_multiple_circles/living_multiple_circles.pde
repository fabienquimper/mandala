boolean debug = true;
ArrayList<CircleArt> particles = new ArrayList<CircleArt>();

void setup() {
  size(600, 600); 
  smooth(10);
  background(255);
  
  //particles.add(new CircleArt(debug));
  for(int i = 0; i < 30; i++) {
    CircleArt circle = new CircleArt(debug, random(10.5), random(10.0), random(600), random(15)+300);
    circle.forceAngle(random(360));
    particles.add(circle);
  }
  
  
  
}

void draw() {
  background(255);
  
  println(particles.size() + "XXXWW" + random(10.0));
  for (int i = 0; i < particles.size(); i++) {
    CircleArt part = particles.get(i);
    part.display();
    part.update();
    part.updateAngle();
  }
}
