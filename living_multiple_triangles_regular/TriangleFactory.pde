class TriangleArtFactory {
  ArrayList<TriangleArt> particles = new ArrayList<TriangleArt>();
  int nb_particule = 1;
  float current_angle = 0.0;
  float step_angle = 360.0;
  float maxDurationStoper = -1;
  
  TriangleArtFactory(int _nb_particule, float _maxDurationStoper, float _triangle_dist_center, float _triangle_max_opacity_seconds) {
    nb_particule = _nb_particule;
    step_angle = 360.0 / _nb_particule;
    maxDurationStoper = _maxDurationStoper;
    
    for(int i = 0; i < nb_particule; i++) {
      TriangleArt triangle = new TriangleArt(debug, _triangle_dist_center, _triangle_max_opacity_seconds, 600, 300);
      triangle.forceAngle(current_angle);
      current_angle += step_angle;
      particles.add(triangle);
      triangle.setMaxDurationStoper(maxDurationStoper);
    }
  }
  
  void draw() {
    for (int i = 0; i < particles.size(); i++) {
      TriangleArt part = particles.get(i);
      part.display();
      part.update();
      part.updateAngle();
    } 
  }
}
