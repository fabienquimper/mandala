boolean debug = true;

// Particule system
TriangleArtFactory particules1 = new TriangleArtFactory(17, 5.1, 10.5, 10.0);
TriangleArtFactory particules2 = new TriangleArtFactory(6, 3.1, 2.5, 3.0);
CircleFactory particules3 = new CircleFactory(20, 3.1);

PFont font;
float duration_max_opacity_title = 6.0;
float start_title_viewable = 3.0;

// COMMAND: ffmpeg -framerate 24 -i %04d-export.tga output.mp4

// Capture video
final int SECONDS_TO_CAPTURE = 20;
final int VIDEO_FRAME_RATE = 60;
// Set up video variables
boolean recordVideo = true;
int videoFramesCaptured = 0;
void recordVideo() {
     if (recordVideo){
        saveFrame("export/####-export.tga");
        if (videoFramesCaptured > VIDEO_FRAME_RATE * SECONDS_TO_CAPTURE){
            recordVideo = false;
            videoFramesCaptured = 0;
        }else{
            videoFramesCaptured++;
        }

        pushStyle();
        noFill();
        strokeWeight(2);
        stroke(255,0,0);
        rect(0, 0, width, height);
        popStyle();
    } 
}

void setup() {
  size(600, 600); 
  smooth(10);
  background(255);
  
  // Font for the title
  //font = createFont("./Caviar-Dreams/CaviarDreams.ttf", 32);
  font = createFont("./Caviar-Dreams/Caviar_Dreams_Bold.ttf", 32);
}

void draw() {
  background(255);

  particules1.draw();
  particules2.draw();
  particules3.draw();

  // Render the title
  textSize(32);
  float opacity = get_title_opacity();
  if (debug) {
    println("Opacity title = " + opacity);
  }
  int red = 66;
  int green = 119;
  int blue = 177;
  fill(red, green, blue, opacity);
  textFont(font);
  text("Mandala :D!", 200, 470);
}

float get_title_opacity() {
  // Render the title 
  if ((millis() / 1000.0) < start_title_viewable) {
    return 0;
  } else {
    float opacity = sqrt(((millis() / 1000.0) - start_title_viewable)) / duration_max_opacity_title * 255.0;
    if (opacity > 255.0 ) {
      opacity = 255;
    }
    return opacity;
  }
}
