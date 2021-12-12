PImage img;
ArrayList<Dot> dots;
int scaler = 10;
void setup() {
  size(640, 480, P2D);  
  img = loadImage("piggy.jpg");
  img.loadPixels();
  img.resize(640,480);
  surface.setSize(img.width, img.height);
  dots = new ArrayList<Dot>();

  for (int x = 0; x < img.width; x += scaler) {
    for (int y = 0; y < img.height; y += scaler) {
      // this translates x and y coordinates into a location in the pixels array
      int loc = x + y * (img.width);
      
      dots.add(new Dot(x, y, img.pixels[loc]));
    }
  }
}

void draw() {  
  delay(50);
  for (int i=0; i<500; i++) {
    int index1 = int(random(5, img.pixels.length));
    int index2 = int(random(0, img.pixels.length));
    img.pixels[index1] = img.pixels[index2];
  }

  img.updatePixels();
    
  image(img, 0, 0);
    surface.setTitle("" + frameRate);
    for (Dot dot : dots) {
    dot.run();
  }
   
}
