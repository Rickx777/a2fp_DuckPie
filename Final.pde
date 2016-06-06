class vis{
	int dx; //window width
	int dy; //window height
	int p; //keeps track of progress
	int c; //keeps track of options given

	vis(int d){
		dx = 600;
		dy = 300;
		p = 0;
		c = d;
	}
}


/* ----TEST code for animations----
class Animation { //credit to processing.com for code!
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage("./animate/" + filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
} //credit to processing.com for code!

Animation test;
void setup(){
	size(600,300);
	background(0,0,0);
	frameRate(25);
	test = new Animation("AB_",50);
}

int x = 0;
void draw() {
	test.display(0,0);
	if (x == 50){
		exit();
	}
 	x++;
}
*/