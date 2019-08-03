ArrayList <Ball> balls = new ArrayList<Ball>();

int numBalls = 200;
int score = 0;

void setup(){
  size(500, 500);
  frameRate(60);
  
  for(int i = 0; i < numBalls; i++){
    balls.add(new Ball());
  }
}

void draw(){
  background(255);
  
  for(int i = 0; i < balls.size(); i++){
    balls.get(i).drawBall();
  }
  
  textSize(15);
  fill(0);
  text("Points: " + score, 5, 15);
  if(balls.size() == 0){
    textSize(32);
    fill(0);
    text("Game Over!", 160, 270);
  }
}

void mousePressed(){
  for(int i = balls.size() - 1; i >= 0; i--){
    float dist = sqrt(((balls.get(i).x - mouseX) * (balls.get(i).x - mouseX)) + ((balls.get(i).y - mouseY) * (balls.get(i).y - mouseY)));
    if(dist <= 11){
      balls.get(i).exist = false;
      int speedBonus = int(abs(balls.get(i).speed.x) + abs(balls.get(i).speed.y));
      int timeBonus = int((20000.0 / millis()) * 10);
      score += 1 + speedBonus + timeBonus;
      balls.remove(i);
      break;
    }
  }
}
