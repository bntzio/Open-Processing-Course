/**
  *Minim es una librería para cosas de audio
  */

import ddf.minim.*;

Minim minim;
AudioPlayer player;
String message;

void setup()
{
  size(512, 200);
  
  minim = new Minim(this);
  player = minim.loadFile("CanoninD.mp3");
  
  message="Nothing";
}

void draw()
{
   background(0);
   textSize(20);
   text(message, 20,20);
}

void keyPressed()
{
  if(key == 'p')
  {
       if(player.isPlaying())
       {
          player.pause();
          message = "Pause";
       }
       else
       {
          player.play();
          message = "Play";
       }
  }
  if(key == 'r')
  {
       player.rewind();
       message = "Rewind";
  }
}
