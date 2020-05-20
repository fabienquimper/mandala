class CircleFactory {
  ArrayList<CircleArt> particles = new ArrayList<CircleArt>();
  int nb_particule = 1;
  float current_angle = 0.0;
  float step_angle = 360.0;
  float maxDurationStoper = -1;
  
  CircleFactory(int _nb_particule, float _maxDurationStoper) {
    nb_particule = _nb_particule;
    step_angle = 360.0 / _nb_particule;
    maxDurationStoper = _maxDurationStoper;
    
    for(int i = 0; i < nb_particule; i++) {
      CircleArt circle = new CircleArt(debug, 2.5, 2.0, 600, 300);
      circle.forceAngle(current_angle);
      current_angle += step_angle;
      particles.add(circle);
      circle.setMaxDurationStoper(maxDurationStoper);
    }
  }
  
  void draw() {
    for (int i = 0; i < particles.size(); i++) {
      CircleArt part = particles.get(i);
      part.display();
      part.update();
      part.updateAngle();
    } 
  }
}
