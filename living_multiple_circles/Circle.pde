class CircleArt {
  
  boolean debug = true;
  
  float circle_dist_center = 0.1;
  float circle_alpha = 0.0;
  float circle_max_opacity_seconds = 10.0;
  float circle_x = 300;
  float circle_y = 300;
  
  float angle_radian = 0.0;
  final int center_x = 300;
  final int center_y = 300;
  
  int red = 0;
  int green = 0;
  int blue = 255;
  
  CircleArt(boolean _debug) {
    this.debug = _debug;
  }
  
  CircleArt(boolean _debug, float _circle_dist_center, float _circle_max_opacity_seconds, float _circle_x, float _circle_y) {
    this.debug = _debug;
    this.circle_dist_center = _circle_dist_center;
    this.circle_max_opacity_seconds = _circle_max_opacity_seconds;
    this.circle_x = _circle_x;
    this.circle_y = _circle_y;
    this.blue = this.blue - int(random(50));
  }
  
  void forceAngle(float _angle_degres) {
    angle_radian = radians(_angle_degres);
    this.circle_x = center_x + cos(angle_radian) * circle_dist_center;
    this.circle_y = center_y + sin(angle_radian) * circle_dist_center;
  }
  
  void updateAngle() {
    this.circle_x = center_x + cos(angle_radian) * circle_dist_center;
    this.circle_y = center_y + sin(angle_radian) * circle_dist_center;
  }
  
  float get_dist(float _current) {
    return (millis()/10000.0) + _current;
  }
  
  float get_alpha(float _current) {
    float timing_second = millis()/1000.0;
    timing_second = timing_second - 3.0; 
    float result = (timing_second <= circle_max_opacity_seconds) ? 255.0 * (timing_second / circle_max_opacity_seconds) : 255.0 - 255.0 * (timing_second - circle_max_opacity_seconds);
    
    if ( result < 0.0) {
        return 0.0;
    } else {
       return result; 
    }
  }
  
  void update() {
    if (debug) {
      println("millis=" + millis() + "  dist=" + circle_dist_center + "  alpga=" + circle_alpha);
    }
    
    circle_dist_center = get_dist(circle_dist_center);
    circle_alpha = get_alpha(circle_alpha);
  }
  
  
  void display() {
    fill(red,green,blue,circle_alpha);
    noStroke();
    circle(circle_x, circle_y, circle_dist_center);
  }
}
