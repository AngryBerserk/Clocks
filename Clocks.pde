final float MAJOR_TIC_SIZE = 20;
final float MINOR_TIC_SIZE = 10;
final float DIGIT_DISTANCE = 100;

void setup(){
 size(800,600);
 textSize(32);
}


void draw(){

  fill(0,0,0, 25);
  rect(0,0,width, height);
  noFill();
  float angle = TWO_PI / 60;
  float ds = TWO_PI / 60;
  float dh = TWO_PI / 12;
  translate(width/2, height/2);
  scale(1.7);
  
  stroke(255,255,0);
  pushMatrix();
  //ticks
    for (int i = 0; i < 60; i++){
      noFill();
      if (i % 5 == 0){
        strokeWeight(2);
        line(0,-DIGIT_DISTANCE,0, -DIGIT_DISTANCE + MAJOR_TIC_SIZE);
        fill(255,0,0);
        text(i/5, 0, -DIGIT_DISTANCE - 20);
      }
      else
        strokeWeight(1);
        line(0,-DIGIT_DISTANCE,0, -DIGIT_DISTANCE + MINOR_TIC_SIZE);
      rotate(angle);
    }
  popMatrix();
  //Seconds arrow
  pushMatrix();
  noFill();
  stroke(0,0,255);
  arc(0,0,DIGIT_DISTANCE * 2 + 7,DIGIT_DISTANCE * 2 + 7, -PI/2, -PI/2 + ds * second());
  rotate(ds * second());
  strokeWeight(1);
  line(0,0,0, -DIGIT_DISTANCE);
  popMatrix();
  //Minutes arrow
  pushMatrix();
  noFill();
  strokeWeight(2);
  stroke(255,0,0);
  arc(0,0,DIGIT_DISTANCE * 2 + 11,DIGIT_DISTANCE * 2 + 11, -PI/2, -PI/2 + ds * minute());
  rotate(ds * minute());
  line(0,0,0, -DIGIT_DISTANCE + 20);
  popMatrix();
  //Hours arrow
  pushMatrix();
  strokeWeight(3);
  stroke(0,255,0);
  int hours = hour();
  if (hours > 11) hours = hours - 12;
  arc(0,0,DIGIT_DISTANCE * 2 + 18,DIGIT_DISTANCE * 2 + 18, -PI/2, -PI/2 + dh * hours);
  rotate(dh * hours);
  line(0,0,0, -DIGIT_DISTANCE + 50);
  popMatrix();
  strokeWeight(1);
}