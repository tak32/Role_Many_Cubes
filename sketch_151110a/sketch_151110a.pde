//Scrollbar Rbar, Gbar, Bbar;
//Box rotate
float brx, bry;

//Box size
float bv = 150.0;

//Color 
float red1, green1, blue1;
float red2, green2, blue2;
float vred1, vgreen1, vblue1;
float vred2, vgreen2, vblue2;
float R_red1, R_green1, R_blue1;
float R_red2, R_green2, R_blue2;
int fillSwitch = 0;
int rotateSwitch = 0;

float sX, sY ,sZ;

void setup() {
  //Rbar = new Scrollbar(10, 35, 80, 10, 0.0, 255.0);
  //Gbar = new Scrollbar(10, 55, 80, 10, 0.0, 255.0);
  //Bbar = new Scrollbar(10, 85, 80, 10, 0.0, 255.0);
  size(1600, 1200, P3D);
  noFill();
}

void draw() {

  //Stroke Color
  R_red1 += random(-1, +1) * 0.6;
  R_green1 += random(-1, +1) * 0.6;
  R_blue1 += random(-1, +1) * 0.6;
  R_red1 *= 0.99;
  R_green1 *= 0.99;
  R_blue1 *= 0.99;
  
  vred1 += R_red1;
  vgreen1 += R_green1;
  vblue1 += R_blue1;
  
  red1 = 255+vred1;
  green1 = 255+vgreen1;
  blue1 = 255+vblue1;
  
  //Fill Color
  R_red2 += random(-1, +1) * 0.6;
  R_green2 += random(-1, +1) * 0.5;
  R_blue2 += random(-1, +1) * 0.6;
  R_red2 *= 0.99;
  R_green2 *= 0.99;
  R_blue2 *= 0.99;
  
  vred2 += R_red2;
  vgreen2 += R_green2;
  vblue2 += R_blue2;
  
  red2 = 255+vred2;
  green2 = 255+vgreen2;
  blue2 = 255+vblue2;
  
  //Cube's randum Rotate
 switch(rotateSwitch){
   case 0:
    sZ += 2.0;
    sY += 2.0;
    break;
   case 1:
    sX -= 5.0;
    sZ += 7.0;
    break;
   case 2:
    sX += 2.0;
    sY -= 3.0;
    break;
   case 3:
    sX += 2.0;
    sY -= 3.0;
    break;
   case 4:
    sZ -= 10.0;
    sY -= 10.0;
    break;
   default:
    sX += 0.5;
    sY -= 0.5;
    sZ -= 0.5;
  }
  
  if(second()%4 == 0){
    rotateSwitch = (int)random(0, 5) * 1;
  }
  
  //Line's Color
  stroke(red1, green1, blue1);
  
  //Background Color
  background(0);
  
  //Material and Lighting
  lights();
  strokeWeight(5);
  ambientLight(102, 102, 102);
  lightSpecular(204, 204, 204);
  directionalLight(102, 102, 102, 0, 0, -1);
  specular(255, 255, 255);
  float shine=map(mouseX, mouseY, width, 1, 10);
  shininess(shine);
  
  //Camera's Point
  translate(width/2, height/2, -height);
  float rz = map(sZ, 0, height, 0, PI);
  float ry = map(sY, 0, width, 0, HALF_PI);
  float rx = map(sX, 0, width, 0, HALF_PI);
  rotateZ(rz);
  rotateY(ry);
  rotateX(rx);
  
  //Create Cubes
  CreateCubes();
    
}

void CreateCubes(){
  for(int y = -2; y <=2; y++){
      for(int x = -2; x <=2; x++){
        for(int z = -2; z <=2; z++){
        pushMatrix();
        translate(300*x, 300*y, -300*z);
        if(mouseButton == LEFT){
          brx = mouseX / 200.0;
          bry = mouseY / 100.0;
          rotateX(brx);
          rotateY(bry);
        }
        box(bv);
        popMatrix();
      }
    }
  }
}

//Clicked Fill
void keyPressed(){
   if((key == 'f' || key == 'F')  && fillSwitch == 0){
     println("fillOn");
     fill(red2, green2, blue2);
     fillSwitch = 1;
   } else if((key == 'f' || key == 'F') && fillSwitch == 1){
     println("fillOff");
     noFill();
     fillSwitch = 0;
   }
}


void mouseDragged(){
  if(mouseButton == RIGHT){
      bv = mouseX /5;
    } 
}
  
  //public class Scrollbar{
  //  int x, y;
  //  float sw, sh;
  //  float pos;
  //  float posMin, posMax;
  //  boolean rollover;
  //  boolean locked;
  //  float minVal, maxVal;
    
  //  Scrollbar(int xp, int yp, int w, int h, float miv, float mav){
  //    x = xp;
  //    y = yp;
  //    sw = w;
  //    sh = h;
  //    minVal = miv;
  //    maxVal = mav;
  //    pos = x + sw/2 - sh/2;
  //    posMin = x;
  //    posMax = x + sw - sh;
  //  }
  //  void update(int mx, int my){
  //    if(over(mx, my) == true){
  //      rollover = true;
  //    } else{
  //      locked = false;
  //    }
  //  }
    
  //  void press(int mx, int my){
  //    if(rollover == true){
  //      locked = true;
  //    } else {
  //      locked =false;
  //    }
  //  }
    
  //  void release(){
  //    locked = false;
  //  }
    
  //  boolean over(int mx, int my){
  //    if((mx > x) && (mx < x+sw) && (my > y) && (my< y+sh)) {
  //      return true;
  //    } else{
  //      return false;
  //    }
  //  }
    
  //  void display(){
  //    fill(255);
  //    rect(x, y, sw, sh);
  //    if((rollover == true) || (locked == true)){
  //      fill(0);
  //    } else {
  //      fill(102);
  //    }
  //    rect(pos, y, sh, sh);
  //  }
  //  float getPOS(){
  //    float scalar = sw/(sw - sh);
  //    float ratio = ((pos - x) * scalar) / sw;
  //    float thumbPos = minVal + (ratio * (maxVal-minVal));
  //    return thumbPos;
  //  }
  //}

  

//void mouseDragged(){
//  for(int y = -2; y <=2; y++){
//    for(int x = -2; x <=2; x++){
//      for(int z = -2; z <=2; z++){
//        pushMatrix();
//        translate(300*x, 300*y, -300*z);
//        box(mouseY);
//        popMatrix();
//      }     
//    }
//  }
//}