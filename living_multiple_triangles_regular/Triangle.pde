class TriangleArt {
  
  boolean debug = true;
  
  float triangle_dist_center = 0.1;
  float triangle_alpha = 0.0;
  float triangle_max_opacity_seconds = 10.0;
  float triangle_x = 300;
  float triangle_y = 300;
  
  float angle_radian = 0.0;
  final int center_x = 300;
  final int center_y = 300;
  
  int red = 66;
  int green = 119;
  int blue = 177;
  
  float maxDurationStoper = -1;
  
  TriangleArt(boolean _debug) {
    this.debug = _debug;
  }
  
  TriangleArt(boolean _debug, float _triangle_dist_center, float _triangle_max_opacity_seconds, float _triangle_x, float _triangle_y) {
    this.debug = _debug;
    this.triangle_dist_center = _triangle_dist_center;
    this.triangle_max_opacity_seconds = _triangle_max_opacity_seconds;
    this.triangle_x = _triangle_x;
    this.triangle_y = _triangle_y;
    this.blue = this.blue - int(random(10));
  }
  
  void setMaxDurationStoper(float _maxDurationStoper) {
    maxDurationStoper = _maxDurationStoper;
  }
  
  void forceAngle(float _angle_degres) {
    angle_radian = radians(_angle_degres);
    this.triangle_x = center_x + cos(angle_radian) * triangle_dist_center;
    this.triangle_y = center_y + sin(angle_radian) * triangle_dist_center;
  }
  
  void updateAngle() {
    if (maxDurationStoper == -1 || (millis()/1000.0) <= maxDurationStoper ) {
      this.triangle_x = center_x + cos(angle_radian) * triangle_dist_center;
      this.triangle_y = center_y + sin(angle_radian) * triangle_dist_center;
    }
  }
  
  float get_dist(float _current) {
    return (millis()/10000.0) + _current;
  }
  
  float get_alpha(float _current) {
    float timing_second = millis()/1000.0;
    timing_second = timing_second - 3.0; 
    float result = (timing_second <= triangle_max_opacity_seconds) ? 255.0 * (timing_second / triangle_max_opacity_seconds) : 255.0 - 255.0 * (timing_second - triangle_max_opacity_seconds);
    
    if ( result < 0.0) {
        return 0.0;
    } else {
       return result; 
    }
  }
  
  void update() {
    if (debug) {
      println("millis=" + millis() + "  dist=" + triangle_dist_center + "  alpga=" + triangle_alpha);
    }
    
    if (maxDurationStoper == -1 || (millis()/1000.0) <= maxDurationStoper ) {
      triangle_dist_center = get_dist(triangle_dist_center);
      triangle_alpha = get_alpha(triangle_alpha);
    }
  }
  
  
  void display() {
    fill(red,green,blue,triangle_alpha);
    noStroke();
    pushMatrix();
    translate(triangle_x, triangle_y);
    rotate(angle_radian);
    //triangle(0, 0, -50, -50, 0, -100);
    triangle(0, -50, 0, 50, 50, 0);
    //triangle(-50, 0, 50, 50, 100, 0);
    popMatrix();
  }
}
