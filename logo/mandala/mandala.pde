final int window_width = 700;
final int window_height = 900;

PImage img;
float angle;
float jitter;

void setup() {
  size(700, 900);
  img = loadImage("myCanvas.png");  // Load an image into the program 
  noStroke();
  fill(255);
 // rectMode(CENTER);
   smooth(10);
 // hint(ENABLE_STROKE_PURE);
}

void draw() { 
 // translate(-img.width/2.0, -img.height/2.0);
  textSize(32);
  fill(0, 102, 153);
  text("Mandala Yoga", window_width/2, window_height - 60);
 
  pushMatrix();
  scale(0.45);
  //translate(-img.width/2.0+300, -img.height/2.0+300);
  translate(img.width/2.0-120, img.height/2.0-120);
  rotate(angle);
  //image(img, 0, 0);  // Display at full opacity
  tint(255, 127);  // Display at half opacity
  image(img, -img.width/2.0, -img.height/2.0);  // Display at full opacity
  popMatrix();
 
  angle += 0.005;
  //angle += 0.001*frameCount;
  println(frameCount);
}
