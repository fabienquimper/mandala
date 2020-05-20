boolean debug = true;
ArrayList<TriangleArt> particles = new ArrayList<TriangleArt>();

void setup() {
  size(600, 600); 
  smooth(10);
  background(255);
  
  //particles.add(new TriangleArt(debug));
  for(int i = 0; i < 40; i++) {
    TriangleArt triangle = new TriangleArt(debug, random(10.5), random(10.0), random(600), random(15)+300);
    triangle.forceAngle(random(360));
    particles.add(triangle);
  }
}

void draw() {
  background(255);
  
  println(particles.size() + "XXXWW" + random(10.0));
  for (int i = 0; i < particles.size(); i++) {
    TriangleArt part = particles.get(i);
    part.display();
    part.update();
    part.updateAngle();
  }
}
