class Ardilla
{
  PImage imagen;
  int coor_x;
  int coor_y;
  int vel;
  
  Ardilla()
  {
     coor_x = 0;
     coor_y = 0;
     vel = 5;
  }
  
  void setImagen(String nombre)
  {
    imagen = loadImage(nombre);
  }
  
  void setX(int x)
  {
    coor_x = x;
  }
  
  void setY(int y)
  {
    coor_y = y;
  }
  
  void setVel(int v)
  {
    vel = v;
  }
  
  void mover()
  {
     coor_x = coor_x + vel;
     coor_y = coor_y + vel;
  }
  
  void pintar()
  {
    image(imagen, coor_x, coor_y);
  }
}
