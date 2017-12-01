class Ball 
{
  float x;
  float y;
  int diam = 20;
  float speedX = random(2,4);
  float speedY = random(2,4);
  
  Ball(){}
  Ball(float x, float y)
  {
    this.x = x; this.y = y;
  }
  
  void reset(float x, float y) 
  {
    this.x = x;
    this.y = y;
    this.speedX = random(3,5);
    this.speedY = random(3,5);
  }
  
  void draw()
  {
    ellipse(this.x, this.y, this.diam, this.diam);
  }
}

class Paddle 
{
  float x;
  float y;
  int height = 150;
  int width = 20;
  
  Paddle(){}
  Paddle(float x, float y, int height)
  {
    this.x = x; this.y = y;
    this.height = height;
  }
  
  float top() 
  {
    return this.y-this.height/2;
  }

  float bottom() 
  {
    return this.y+this.height/2;
  }
  
  void reset(float x, float y, int height)
  {
    this.x = x; this.y = y;
    this.height = height;
  }
  
  void shrink(int val)
  {
    this.height = Math.max(width*2, height-val);
  }
  
  void draw() 
  {
    rect(x, y-this.height/2, this.width, this.height);
  }
}
 
Ball ball;
Paddle paddle;
boolean running;
int score;
String voice = "Hey! My name is Walter, it's so lovely to meet you!";

void setup() 
{
  size(500, 500);
  noCursor();
  noStroke();
  smooth();
  textSize(200);
  textAlign(CENTER, CENTER);
  ellipseMode(CENTER);
  ball = new Ball(width/4, height/2);
  paddle = new Paddle(width-30, height/2, 150);
}
 
void draw() 
{
  background(255);
  fill(0, 102, 153);
  textSize(30);
  text(score, width/2, height/2-30); //score
  textSize(12);
  text(voice, width/2, height/3); // words taunting the players
  fill(0);
  rect(0, 0, 20, height);           // walls
  rect(0, 0, width-45, 20);       
  rect(0, height-20, width-45, 20);       
  ball.draw();                      // ball
  paddle.draw();                    // paddle

  if (running) 
  {
    ball.x += ball.speedX;
    ball.y += ball.speedY;
 
    // test for hit against paddle
    if (ball.x > paddle.x && ball.x < paddle.x+paddle.width 
        && ball.y > paddle.top() && ball.y < paddle.bottom()) 
    {
        ball.speedX = ball.speedX * -1;
        ball.x = ball.x + ball.speedX;
        score++;
        if (score == 0) {
           voice = "Ouch!";
        } else if (score == 1) {
           voice = "Wait... what are you doing?"; 
        } else if (score == 2) {
           voice = "What are you doing?? It's going to hit me again!";
        } else if (score == 3) {
           voice = "Ouch! Don't let it hit me please, I'm begging you!"; 
        } else if (score == 4) {
           voice = "Oh god, oh sweet Jesus, this is painful!"; 
        } else if (score == 5) {
           voice = "What are you getting out of this?"; 
        } else if (score == 6) {
           voice = "Fu- sorry excuse my language, but please stop this right now!"; 
        } else if (score == 7) {
           voice = "AGH! I WILL CALL MY LAWYERS."; 
        } else if (score == 8) {
           voice = "SWEET! JESUS! DO NOT THINK I WILL HESITATE TO CALL 911"; 
        } else if (score == 9) {
           voice = "FUCK! Agh! STOP THIS!"; 
        } else if (score == 10) {
           voice = "OOF! I WANT YOU TO MISS FOR GOODNESS SAKE"; 
        } else if (score == 11) {
           voice = "GAH! BET YOU MISS THIS NEXT ONE"; 
        } else if (score == 12) {
           voice = "OUCH, ah shi- erm, excuse me, but what are you gaining from this??!?!?"; 
        } else if (score == 13) {
           voice = "WHYYY!!???? AHHH"; 
        } else if (score == 14) {
           voice = "JESUS IF YOU ARE OUT THERE, HERE MY CALL, I NEED YOUR HELP"; 
        } else if (score == 15) {
           voice = "MOTHER OF JESUS, I WANT YOU TO MISS"; 
        } else if (score == 16) {
           voice = "I BET YOU MISS THIS NEXT ONE"; 
        } else if (score == 17) {
           voice = "YOUR MOTHER, SHE IS HIDEOUS, I KNOW I SAW HER LAST NIGHT"; 
        } else if (score == 18) {
           voice = "GOD NO! AGH! YOU'RE A BEAST"; 
        } else if (score == 19) {
           voice = "FUCK FUCK I DON'T CARE ABOUT GENTLEMANLINESS IF YOU ARE THIS SAVAGE"; 
        } else if (score == 20) {
           voice = "SCREW YOU YOU FOOL"; 
        } else if (score == 21) {
           voice = "BET YOU LOSE THIS NEXT ONE YOU WORTHLESS EXCUSE OF A HUMAN"; 
        } else if (score == 22) {
           voice = "MISS MISS MISS JUST MISS FOR FUCK'S SAKE"; 
        } else if (score == 23) {
           voice = "Who hurt you as a child? I just want to know."; 
        } else if (score == 24) {
           voice = "fuCK"; 
        } else if (score == 25) {
           voice = "I need a hospital"; 
        } else if (score == 26) {
           voice = "I'll pay you money to stop. Hundreds of dollars."; 
        } else if (score == 27) {
           voice = "I'll let you date my daughter. She's a beauty, she's your age."; 
        } else if (score == 28) {
           voice = "AGH! Ouch agh. Take my wife, too, if you stop you can take both."; 
        } else if (score == 29) {
           voice = "SCREW YOU, YOU FOOL AGHHH THIS PAIN!"; 
        } else if (score == 30) {
           voice = "OH GOD, PLEASE DELIVER ME FROM THIS PUNISHMENT"; 
        } else if (score == 31) {
           voice = "AGH! FUCK YOU!"; 
        }
    }
    // test for hit against back wall
    else if (ball.x < 25) {
      ball.speedX = ball.speedX * -1.1;
      ball.x = ball.x + ball.speedX;
        if (score == 0) {
           voice = "Ouch!";
        } else if (score == 1) {
           voice = "Ouch! Ouch!"; 
        } else if (score == 2) {
           voice = "AGH";
        } else if (score == 3) {
           voice = "Ouch!"; 
        } else if (score == 4) {
           voice = "Oh god, oh sweet Jesus, this is painful!"; 
        } else if (score == 5) {
           voice = "What are you getting out of this?"; 
        } else if (score == 6) {
           voice = "OOF"; 
        } else if (score == 7) {
           voice = "AGH!"; 
        } else if (score == 8) {
           voice = "SWEET! JESUS!"; 
        } else if (score == 9) {
           voice = "FUCK! Agh! Excuse my French!"; 
        } else if (score == 10) {
           voice = "OOF!"; 
        } else if (score == 11) {
           voice = "GAH!"; 
        } else if (score == 12) {
           voice = "OUCH, what are you gaining from this??!?!?"; 
        } else if (score == 13) {
           voice = "WHYYY!!????"; 
        } else if (score == 14) {
           voice = "AGH HELP ME"; 
        } else if (score == 15) {
           voice = "MOTHER OF JESUS"; 
        } else if (score == 16) {
           voice = "OUCH"; 
        } else if (score == 17) {
           voice = "GODDAMNIT"; 
        } else if (score == 18) {
           voice = "GOD NO"; 
        } else if (score == 19) {
           voice = "FUCK FUCK"; 
        } else if (score >= 20) {
           voice = "SCREW YOU"; 
        }
    }
    // reset if ball scores on paddle
    else if (ball.x > width) {
      running = false;
      ball.reset(width/4, height/2);
      paddle.reset(width-30, height/2, 150);
      if (score == 0) {
        voice = "You missed!";
      } else if (score > 0 && score <= 5) {
        voice = "Thank goodness, you missed, spare me this pain! Ah!"; 
      } else if (score > 5 && score <= 10) {
        voice = "JESUS I am finally freed of this pain!"; 
      } else if (score > 10 && score <= 15) {
        voice = "YOU SCOUNDREL, YOU FOOL. YOU MISSED."; 
      } else if (score >= 15) {
        voice = "HA HA! YOU PIECE OF GARBAGE. YOU FAILED. HOW DOES IT FEEL NOW?"; 
      } 
      score = 0;
    }
    // test for hit against top or bottom
    if (ball.y > height - 20 || ball.y < 20 ) {
      ball.speedY = ball.speedY*-1;
      ball.y = ball.y + ball.speedY;
        if (score == 0) {
           voice = "Ouch!";
        } else if (score == 1) {
           voice = "Ouch! Ouch!"; 
        } else if (score == 2) {
           voice = "AGH!";
        } else if (score == 3) {
           voice = "Ouch!"; 
        } else if (score == 4) {
           voice = "Oh god!"; 
        } else if (score == 5) {
           voice = "What are you getting out of this?"; 
        } else if (score == 6) {
           voice = "MMM OW OW"; 
        } else if (score == 7) {
           voice = "AGH!"; 
        } else if (score == 8) {
           voice = "SWEET! JESUS!"; 
        } else if (score == 9) {
           voice = "FUCK! Agh! Excuse my French!"; 
        } else if (score == 10) {
           voice = "OOF!"; 
        } else if (score == 11) {
           voice = "GAH!"; 
        } else if (score == 12) {
           voice = "OFJ2NVDA023"; 
        } else if (score == 13) {
           voice = "WHYYY!!????"; 
        } else if (score == 14) {
           voice = "AGH HELP ME"; 
        } else if (score == 15) {
           voice = "MOTHER OF JESUS"; 
        } else if (score == 16) {
           voice = "NO"; 
        } else if (score == 17) {
           voice = "AGH"; 
        } else if (score == 18) {
           voice = "NO"; 
        } else if (score == 19) {
           voice = "FUCK"; 
        } else if (score >= 20) {
           voice = "SCREW YOU"; 
        }
    }
  }
}

void mouseMoved()
{
  // move paddle
  paddle.y = mouseY;
}

void mousePressed() 
{
  // start game
  running = true;
}