Ardilla artie;
Avellana ave;

void setup()
{
  artie = new Ardilla();
  artie.setImagen("ardillita.jpg");
  artie.setX(100);
  artie.setVel(15);
  
  ave = new Avellana(800, 600);
  
  size(800,600);
}

void draw()
{
   background(255);
   artie.pintar(); 
   ave.update();
   ave.draw();
}

void keyPressed()
{
    if(key == 'a')
      artie.mover();
}


