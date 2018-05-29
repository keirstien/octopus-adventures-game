int x, y;
//declare images
PImage octopus;
PImage goalbeachball;
PImage background;
PImage badguy;
PImage badguy2;
PImage badguy3;
PImage badguy4;
PImage shark1;
PImage shark2;
PImage shark3;
PImage shark4;
PImage background2;
PImage background4;
PImage clam;
//Variable to hold the score.
int score;

//Variable for time limit.
int time;
int frames;



//Variables for the location of the goal anf negative goals
int goalX, goalY;
int badX1, badY1;
int badX2, badY2;
int badX3, badY3;
int badX4, badY4;

//sets level you are on
int level;

void setup() {
  size(600, 600);
  textFont(createFont("Consolas", 50));
  fill(255);
  time = 30;
  //loads pictures
  octopus = loadImage("octopus.png");
  goalbeachball = loadImage("goal.png");
  background = loadImage("background.jpg");
  badguy = loadImage("crab-2.png");
  shark1 =loadImage("Shark3.png");
  shark2 =loadImage("Shark3.png");
  shark3 =loadImage("Shark3.png");
  shark4 =loadImage("Shark3.png");
  background2 =loadImage("background2.jpg");
  background4 =loadImage("test.jpg");
  clam= loadImage("Clam 2.0.png");
  x = 200; //Player starts at 200,50
  y = 50;
  score = 2;
  goalX = int(random(width)); //random location for the goal
  goalY = int(random(height));

  //loads negative goals at random location
  badY1=int(random(height));
  badX1=int(random(width));
  badX2=int(random(width));
  badY2=int(random(height));
  badY3=int(random(height));
  badX3=int(random(width));
  badY4=int(random(height));
  badX4=int(random(height));
  //imageMode() changes where the "location" of the image is measured from.  
  imageMode(CENTER);

  level = 1;
  time = 30;
  frames = 0;
}

void draw() {
  //START SCREEN
  if (level ==1) {
    clear();
    background(0); 
    fill(225);
    textSize(60);
    text("octopus adventure", 30, 200);
    textSize(40);
    text("press space to play", 110, 240);
    textSize(30);
    text("collect 30 beachballs to win", 80, 330);
    text("watch out for crabs", 100, 360);
    text("use w key to go up", 140, 390);
    text("use s key to go down", 140, 420);
    text("use a key to go left", 140, 450);
    text("use d key to go right", 140, 470);
    if (key == ' ') {
      level = 2;
    }
  }
  //LEVEL 1
  if (level ==2) {
    clear();
    fill(0);

    image(background, 400, 400, 800, 800);
    text("Score: " +score, 0, 40);
    text("Time: " + time, 300, 40);

    octopus();
    badlevel1();
    control();
    barriers();
    goal();
    timer();


    if ( score > 30) {
      level = 3;
    } else if (score < 0 ||time <= 0) {

      level = 5;
    }
  }


  //LEVEl 2

  //next level
  if (level ==3) {
    clear();

    image(background2, 300, 300, 700, 700);
    fill(0);
    text("Score: " +score, 0, 40);
    text("Time: " + time, 300, 40);
    octopus();
    control();
    goal2();
    barriers();
    timer();
    badlevel2();

    if (score > 40) {
      clear();
      text("Score: " +score, 0, 40);
      text("Time: " + time, 300, 40);

      level = 6;
    } else if (score < 0 ||time <= 0) {

      level = 5;
    }
  }

  //LEVEL 3
  if (level == 4) {
  }

  //LOSE SCREEN
  if (level == 5) {
    fill(#B90006);
    clear();
    textSize(70);
    text("GAME OVER", 130, 200);
    textSize(40);
    text("Press r to restart!!!!", 60, 390);
    text("You scored " + score + " points", 80, 300);
    if (key == 'r' || key == 'R') {
      setup();
      level =2;
    }
  }

  ///WIN SCREEN
  if (level == 6) {
    fill(0);
    clear();
    textSize(70);
    image(background4, 300, 300, 600, 600);
    image(octopus,290,80,150,150);
    text("YOU WIN!", 140, 200);
    textSize(40);
    text("You scored " + score + " points.", 60, 300);
    text("your time was " + time + " out of 30", 15, 370);
    text("Press r to play again!!!!!!!", 10, 440);

    //Reset the game by pressing r.
    if (key == 'r' || key == 'R') {
      setup();
      level =2;
      //movement
    }
  }
}





//MAIN SETUP FUNCTIONS 
void control() {


  if (keyPressed) {

    if (keyCode == RIGHT || key == 'd' || key =='D' ) {
      x = x + 30;
    }

    if (keyCode == LEFT || key == 'a' || key == 'A' ) {
      x = x-30;
    }

    if (keyCode == UP || key == 'w' || key == 'W' ) {
      y = y -30;
    }

    if (keyCode == DOWN || key == 's' || key == 'S' ) {
      y = y+30;
    }
  }
}
void barriers() {

  if ( x > 850) { //Right hand side.
    x=-50;
  }
  if (x < -60) { //Left
    x=850;
  }
  if (y > 850) { //Bottom
    y = -50;
  }
  if (y< -60) { //Top
    y=850;
  }
}
void timer() {
  frames++;
  if (frames > 60) {
    frames =0;
    time--;
  }
}
//main chacter
void octopus () {
  image(octopus, x, y, 150, 150);
}





//LEVEL 1 STUFF
void badlevel1 () {

  image(badguy, badX1, badY1, 100, 100);
  image(badguy, badX2, badY2, 100, 100);
  image(badguy, badX3, badY3, 100, 100);
  image(badguy, badX4, badY4, 100, 100);

  if (abs(x-badX1)<100 && abs(y-badY1)<100) {
    image(badguy, badX1, badY1, 200, 200);
    score -=1;
    badY1= int(random(height));
    badX1= int(random(width));
  } 
  if (abs(x-badX2)<100 && abs(y-badY2)<100) {
    image(badguy, badX2, badY2, 200, 200);
    score -=1;
    badY2= int(random(height));
    badX2= int(random(width));
  }
  if (abs(x-badX3)<100 && abs(y-badY3)<100) {
    image(badguy, badX3, badY3, 200, 200);
    score -=1;
    badY3= int(random(height));
    badX3= int(random(width));
  }
  if (abs(x-badX4)<100 && abs(y-badY4)<100) {
    image(badguy, badX4, badY4, 200, 200);
    score -=1;
    badY4= int(random(height));
    badX4= int(random(width));
  }
}
void goal() {
  image(goalbeachball, goalX, goalY, 100, 100);
  //Score the goal.
  if (abs(x-goalX-25)<50 && abs(y-goalY-25)<50) {
    //Hitbox is 100 x 100 by default.

    //Get a point.
    score +=2;

    //Move the goal to a new random location.
    goalX = int(random(width));
    goalY = int(random(height));
  }
}





//LEVEL 2 STUFF
void badlevel2 () {

  image(shark1, badX1, badY1, 200, 200);
  badX1 =5;
  image(shark2, badX2, badY2, 200, 200);
  image(shark3, badX3, badY3, 200, 200);
  image(shark4, badX4, badY4, 200, 200);

  if (abs(x-badX1)<100 && abs(y-badY1)<100) {
    image(shark1, badX1, badY1, 200, 200);
    score -=1;
    badY1= int(random(height));
    badX1= int(random(width));
  } 
  if (abs(x-badX2)<100 && abs(y-badY2)<100) {
    image(shark2, badX2, badY2, 200, 200);
    score -=1;
    badY2= int(random(height));
    badX2= int(random(width));
  }
  if (abs(x-badX3)<100 && abs(y-badY3)<100) {
    image(shark3, badX3, badY3, 200, 200);
    score -=1;
    badY3= int(random(height));
    badX3= int(random(width));
  }
  if (abs(x-badX4)<100 && abs(y-badY4)<100) {
    image(shark4, badX4, badY4, 200, 200);
    score -=1;
    badY4= int(random(height));
    badX4= int(random(width));
  }
}
void goal2() {
  image(clam, goalX, goalY, 100, 100);
  //Score the goal.
  if (abs(x-goalX-25)<50 && abs(y-goalY-25)<50) {
    //Hitbox is 100 x 100 by default.

    //Get a point.
    score +=2;

    //Move the goal to a new random location.
    goalX = int(random(width));
    goalY = int(random(height));
  }
}




//LEVEL 3 functions