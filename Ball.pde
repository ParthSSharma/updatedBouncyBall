class Ball{
  float x, y;
  PVector speed;
  float w = 20, h = 20;
  float speedMag = 2;
  boolean exist = true;
  
  Ball(){
    x = random(25, 475);
    y = random(25, 475);
    speed = new PVector(random(-speedMag, speedMag), random(-speedMag, speedMag));
  }
  
  void drawBall(){
    if(!exist){
      x = -100;
      y = -100;
      speed.x = 0;
      speed.y = 0;
    }
    else{
      fill(255, 0, 0);
      stroke(0, 255, 0);
      strokeWeight(4);
      ellipse(x, y, w, h);
    }
    
    moveBall();
  }
  
  void moveBall(){
    x += speed.x;
    y += speed.y;
    
    if((x + w / 2 >= width) || (x <= w / 2)){
      speed.x = -speed.x;
    }
    if((y + h / 2 >= height) || (y <= h / 2)){
      speed.y = -speed.y;
    }
  }
}
