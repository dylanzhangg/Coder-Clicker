int clicked = 0;
boolean shop=false;
boolean error = false;
int clickEff = 1;
PImage shopPic;
PImage back;
PImage comp;
PImage keyboard;
PImage collegeIntern;
PImage softwareEngineer;
PImage elonMusk;
PImage codeScreen1;
PImage codeScreen2;
PImage exitButton;
int elon = 100;
int s;
int cps = 0;
int[] costs = {50,150,2500,25000};
final double increment = 1.25;

int hack=0;

void setup() {
  size(370,665);
  back = loadImage("pixil-frame-0.png");
  shopPic = loadImage("shop.png");
  comp = loadImage("comp.png");
  keyboard = loadImage("keyboard.jpg");
  collegeIntern = loadImage("collegeIntern.jpg");
  softwareEngineer = loadImage("softwareEngineer.jpg");
  elonMusk = loadImage("elonMusk.png");
  codeScreen1 = loadImage("codeScreen1.jpg");
  codeScreen2 = loadImage("codeScreen2.jpg");
  exitButton = loadImage("exitButton.jpg");
  s=second();
  PFont myFont = createFont("Bauhaus 93", 31);
  textFont(myFont);
}

void draw() {
  image(back, 0, 0, width, height);
  if (shop) {
    drawShop();
    if (error)
    {
      drawErrorMsg();
    }    
  } 
  else
  {
    fill(204);
    imageMode(CENTER);
    image(comp,width/2,height/2,width/2,width/2);
    imageMode(CORNER);
    image(codeScreen1, width/2.9, height/2.75, width/3, height/5.5);
    imageMode(CORNERS);
    image(shopPic, 3*width/8, 7*height/8-width/8, 5*width/8, 7*height/8+width/4);
    //rect(width/4,7*height/8,width/2,height/8);
    printTop();
    noFill();
  }
  
  if(hack==3){
    hack=0;
    clickEff=69;
    cps = 69;
  }
  
  int sec = second();
  if(sec!=s){
    clicked+=cps*clickEff;
    s =sec;
  }
  
  
}

void drawShop()
{
  clear();
  image(back, 0, 0, width, height);
  printTop();
  imageMode(CORNERS);
  image(shopPic, 3*width/8, height/8, 5*width/8, height/3);
  fill(300);
  textSize(height/32);
  imageMode(CORNER);
  fill(255);
  rect(1.1*width/6,height/3,width/3-0.1*width/6,7*height/24);
  rect(width/2, height/3, width/3-0.1*width/6, 7*height/24);
  rect(1.1*width/6, 15*height/24, width/3-0.1*width/6, 7*height/24);
  rect(width/2, 15*height/24, width/3-0.1*width/6, 7*height/24);
  //tint(158, 255, 158);
  image(keyboard, 1.1*width/6, height/3, width/3-0.1*width/6, 7*height/24); //button 1;
  image(collegeIntern, width/2, height/3, width/3-0.1*width/6, 7*height/24); //button 2
  image(softwareEngineer, 1.1*width/6, 15*height/24, width/3-0.1*width/6, 7*height/24); //button 3
  image(elonMusk, width/2, 15*height/24, width/3-0.1*width/6, 7*height/24); //button 4
  //noTint();
  fill(1);
  text(costs[0],11*width/32,18.25*height/32);
  text(costs[1],43.5*width/64,6.75*height/12);
  text(costs[2],11*width/32,20.5*height/24);
  text(costs[3],43.5*width/64,20.5*height/24);
  imageMode(CORNERS);
  image(exitButton,4*width/12, 5.6*height/6, 2*width/3, height);
  noFill();
}

void printTop() {
  textSize(height/50);

  fill(48,101,206);
  rect(0, 0, width, height/10);
  fill(255);
  textSize(height/25);
  text("$"+clicked, width/16, 1.25*height/16); 
  textAlign(RIGHT);
  textSize(height/50);
  text("Typing Efficiency:", 15*width/16, height/32);
  textSize(height/25);
  text(clickEff, 15*width/16,1.25*height/16);
  textAlign(CENTER);
  textSize(height/50);
  text("Idle Typing:", width/2,height/32);
  textSize(height/25);
  text(cps, width/2, 1.25*height/16);
  textAlign(LEFT);
  fill(1);
}

void drawErrorMsg()
{
  tint(70);
  drawShop();
  noTint();
  fill(255);
  rectMode(CENTER);
  rect(width/2, height/2, width/2, height/6);
  textSize(height/60);

  fill(1);
  text("You do not have enough money", 1.1* width/4, 5.3*height/12);

  rect(width/2, 6.75*height/12, width/2, height/24);
  rectMode(CORNER);

  fill(255);
  textAlign(CENTER);
  text("Exit", width/2, 6.75*height/12);
  textAlign(CORNER);
}

void mouseClickedExit()
{
  if (mouseX > width/4 && mouseX < 3*width/4 && mouseY > 6.75*height/12-height/48 && mouseY < 6.75*height/12+height/48)
      {
        error = false;
      }
}

void drawClickedScreen()
{
  fill(204);
    imageMode(CENTER);
    image(comp,width/2,height/2,width/2,width/2);
    imageMode(CORNER);
    image(codeScreen2, width/2.9, height/2.75, width/3, height/5.5);
    imageMode(CORNERS);
    image(shopPic, 3*width/8, 7*height/8-width/8, 5*width/8, 7*height/8+width/4);
    //rect(width/4,7*height/8,width/2,height/8);
    printTop();
    noFill();
}
void mousePressed() {
  if(mouseX>9*width/10 && mouseY>9*height/10){
    hack++;
  }else if(hack>0){
    hack--;
  }
  if(mouseX<10&&mouseY<10){
    clicked+=25000;
  }
  if (shop) {
    if (error)
    {
      mouseClickedExit();
    }
    else
    {
      mouseClickedShop();
    }
  } else //normal menu clicks
  {
    if (mouseX<3*width/4 &&mouseX>width/4&&mouseY<height/2+width/4&&mouseY>height/2-width/4) {
      clicked+=clickEff;
      drawClickedScreen();
    } else if (mouseX<5*width/8&&mouseX>3*width/8&&mouseY<7*height/8+width/4&&mouseY>7*height/8-width/8) {
      shop=true;  
    }
  }
}

void mouseClickedShop() 
{
  //button 1
  if (mouseX<width/2&&mouseX>width/6&mouseY<15*height/24&&mouseY>height/3) {
    if (clicked>=costs[0])
    {
      clicked-=(costs[0]);
      costs[0]*=1.5;
      clickEff++;
    }
    else
    {
      error = true;
    }
  }
  //button 2
  if (mouseX<5*width/6&&mouseX>width/2&mouseY<15*height/24&&mouseY>height/3) {
    if (clicked>=costs[1])
    {
      clicked-=(costs[1]);
      costs[1]*=increment;

      cps+=1;
    }
    else
    {
      error = true;
    }
  }
  //button 3
  if (mouseX<width/2&&mouseX>width/6&mouseY<22*height/24&&mouseY>15*height/24) {
    if (clicked>=costs[2])
    {
      clicked-=(costs[2]);
      costs[2]*=increment;
      cps+=10;
    }
    else
    {
      error = true;
    }

  }
  //button 4
  if (mouseX<5*width/6&&mouseX>width/2&mouseY<22*height/24&&mouseY>15*height/24) {
    if (clicked>=costs[3])
    {
      clicked-=(costs[3]);
      costs[3]*=increment;
      cps+=elon;
      elon*=1.17;
    }
    else
    {
      error = true;
    }

  }
  
  if(mouseX>width/3 && mouseX<2*width/3 && mouseY>5.6*height/6){
    shop=false;
  }
}
