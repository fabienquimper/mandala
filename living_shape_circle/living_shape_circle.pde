boolean debug = true;

float circle_dist_center = 0.1;
float circle_alpha = 0.0;
float circle_max_opacity_seconds = 10.0;
float circle_x = 300;
float circle_y = 300;

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

void setup() {
  size(600, 600); 
  smooth(10);
  background(255);
}

void draw() {
  background(255);

  if (debug) {
    println("millis=" + millis() + "  dist=" + circle_dist_center + "  alpga=" + circle_alpha);
  }
  circle_dist_center = get_dist(circle_dist_center);
  circle_alpha = get_alpha(circle_alpha);

  fill(0,0,255,circle_alpha);
  noStroke();
  circle(circle_x, circle_y, circle_dist_center);
}
