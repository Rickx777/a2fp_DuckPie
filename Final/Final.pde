class vis{ //Visual handler----------------------------------
	int dx; //window width
	int dy; //window height
	int c; //keeps track of location options
	int m; //option chosen display
	String choosing;

	vis(int b){
		c = b;
		m = 0;
		choosing = "";
	}

	void display(int d){
		c = d;
		if (c == 0){
			image(loadImage("./pictures/Start.png"),0,0);			
		}
	
		else if (c == 1){ //NAMING START-------------
			background(0,0,0);
			text("\n  Welcome to Going to Oregon, who\n\nwould you like as your maties, EPIP!",35,20);
			text("1. " + crew[0].getName(),  35,100);
			text("2. " + crew[1].getName(), 35, 130);
			text("3. " + crew[2].getName(), 35, 170);
			text("4. " + crew[3].getName(), 35, 200);
			text("5. " + crew[4].getName(), 35, 230);
		}

		else if (c == 2){ //MONEY START--------------
			background(0,0,0);			
      text("\n  How much money do you want?\n\n(This affects difficulty and score)", 35, 20);
      text("1. 100", 35, 100);
      text("2. 200", 35, 130);
      text("3. 300", 35, 160);
      text("Your choice: " + choosing, 70, 200);
		}
	}
}

class input{
	int x, y, w, h; 
	boolean isVisable, text;
	String intake;

	input(int please, int get, int work, int done, boolean you, boolean seniors){
		x = please;
		y = get;
		w = work;
		h = done;
		isVisable = you;
		text = seniors;
		intake = "";
	}

	String spush(){
		String tmp = intake;
		intake = "";
		return tmp;
	}	

	int ipush(){
		int tmp = Integer.parseInt(intake);
		intake = "";
		return tmp;
	}
	
	String getDis(){
		return intake;
	}	

	void putit(Character c){
		if (text == false && Character.isLetter(c) == true){
			return;}
		else intake += c;
	}	

}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~game code~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
person[] crew;
vis screen;
input senioritis;
cab cabin;
int dif = 0;
int[] buylist = new int[5];

void setup(){
	size(600,400);
	crew = new person[5];
	crew[0] = new person("EPIP");
	for (int i = 1; i < 5; i++){
		crew[i] = new person("");
	}
	screen = new vis(0);
	screen.display(screen.c);
	senioritis = new input(200,300,200,100,false,true);
	textFont (loadFont("yaya.vlw"));
}

void draw(){
	screen.display(screen.c);
}

void mousePressed(){
	if (screen.c == 0){
			screen.c += 1;
			screen.display(screen.c);
			}
}


int d = 1; //tmp progression vars
void keyPressed(){  //~~~~~~~~~~~~~~~~~~~~~~~~~~HANDLER OF INPUT~~~~~~~~~~~~~~~~//
	if (screen.c == 1){ //@   NAMING PEOPLE     @//
			if (d < 5){
				if (keyCode == ENTER){
					senioritis.spush();
					d += 1;
				}
				if (keyCode != ENTER){
					if (senioritis.intake.length() > 0 && (keyCode == DELETE || keyCode == BACKSPACE)){
						senioritis.intake = senioritis.intake.substring(0,senioritis.intake.length() - 1);
						crew[d].setName( senioritis.getDis() );
						screen.display(screen.c);}
					else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT){
						senioritis.putit(key);
						crew[d].setName( senioritis.getDis() );
						screen.display(screen.c);
					}
				}
			}
		if (d == 5){
			screen.c += 1;
		}
	}

	if (screen.c == 2){ //@      CHOOSING THE MONEYS        @//
		senioritis.text = false;		
		screen.display(screen.c);
		if (keyCode == ENTER && senioritis.intake.length() > 0 && Integer.parseInt(senioritis.getDis()) < 4){
			int diff = senioritis.ipush();
			cabin = new cab(diff * 100);
			screen.c += 1;
			screen.display(screen.c);
		}
		else if (keyCode == ENTER){
			senioritis.intake = "";
			screen.choosing = senioritis.intake;
      screen.display(screen.c);
		}		
		else if (senioritis.intake.length() > 0 && (keyCode == DELETE || keyCode == BACKSPACE)){
      senioritis.intake = senioritis.intake.substring(0,senioritis.intake.length() - 1);
      screen.choosing = senioritis.intake;
      screen.display(screen.c);}
    else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && senioritis.intake.length() < 2){
      senioritis.putit(key);
			screen.choosing = senioritis.intake;
      screen.display(screen.c);
		}
	}

	if (screen.c == 3){//@          SHOP (NON-PROGRESSION)      @//
		 while (shop.c != 0){
					shop.
		 }
	}
}


//------end of game code--------//


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
	size(600,400);
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