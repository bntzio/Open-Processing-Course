class Avellana
{
   int coor_x;
   int coor_y;
   int vel;
   int dimx;
   int dimy;
   PImage img;
   int dir;
   
   Avellana(int tamx, int tamy)
   {
     coor_x = 0;
     coor_y = 0;
     vel = 3;
     dimx = tamx;
     dimy = tamy;
     img = loadImage("hazelnut.png");
     dir=0;
   }
   
   void update()
   {
      if(dir == 0)
      {
        coor_x += vel;
        if(coor_x > (dimx-50))
         {
           coor_x = dimx-50;
           dir = 1;
           return;
         }
      }
      if(dir == 1)
      {
         coor_y += vel;
         if(coor_y > (dimy-73))
         {
           coor_y = dimy-73;
           dir = 2;
           return;
         }
      }
      if(dir == 2)
      {
        coor_x -= vel;
        if(coor_x < 0)
        {
          coor_x = 0;
          dir = 3;
          return;
        } 
      }
      if(dir == 3)
      {
         coor_y -= vel;
         if(coor_y < 0)
         {
           coor_y = 0;
           dir = 0;
           return;
         }
      }
   }
   
   void draw()
   {
     image(img, coor_x, coor_y);
   }
     
   
}
