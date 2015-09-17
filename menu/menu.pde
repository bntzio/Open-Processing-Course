int num_pantalla;
PImage atras, atras2;

void setup()
{
   size(800, 600);
   num_pantalla = 1;
   atras = loadImage("back.jpg");
   atras2 = loadImage("back2.png");
}

void draw()
{
    switch(num_pantalla)
    {
      case 1:
              pantalla_uno();
              break;
      case 2:
              pantalla_dos();
              break;
      case 3:
              pantalla_tres();
              break;        
    }
}

void pantalla_uno()
{
  background(210,210,255);
  
  noStroke();
  fill(255,0,0);
  rect(170,250,55,40);
  fill(0,255,0);
  rect(170,300,55,40);
  
  if (mousePressed && (mouseButton == LEFT) )
  {
    if(mouseX>170 && mouseX<225 && mouseY>250 && mouseY<290)
       num_pantalla = 2;
    if(mouseX>170 && mouseX<225 && mouseY>300 && mouseY<340)
     num_pantalla = 3;
  }
  
  fill(100,100,200);
  textSize(32);
  text("Pantalla Principal", 30,30);
  
   
}

void pantalla_dos()
{
  background(255,210,210);
 
  image(atras,100,100); 

  if (mousePressed && (mouseButton == LEFT) )
  { 
    if(mouseX>100 && mouseX<422 && mouseY>100 && mouseY<257)
      num_pantalla = 1;
  }
      
  fill(200,100,100);
  textSize(22);
  text("Pantalla ROJA", 30,30);
}

void pantalla_tres()
{
  background(210,255,210);
  
  image(atras2,100,100);

   if (mousePressed && (mouseButton == LEFT) )
   {
     if(mouseX>100 && mouseX<242 && mouseY>100 && mouseY<204)
       num_pantalla = 1;
   }
   
  fill(100,200,100);
  textSize(22);
  text("Pantalla VERDE", 30,30);
}


