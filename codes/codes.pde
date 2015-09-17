// *************
// * DEGRADADO *
// *************
size(200, 200);
background(240, 240, 240);
strokeWeight(3);
for(int i=2; i<180; i= i+15)
{
  stroke(100+i,0,0);
  line(30, i, 80, i);
}

// *********************
// * CARGAR UNA IMAGEN *
// *********************
// Declarar variable del tipo PImage
PImage img; 
void setup() {
  size(320,240);
  // Crear una imagen
  img = loadImage("image1.jpg");
}
void draw() {
  background(255);
  // Dibujar la imagen
  image(img,100,0);
}

// ***************************************
// * ANIMACIÓN CON SECUENCIA DE IMÁGENES *
// ***************************************
int numFrames = 3;  //Número de cuadros de la animación
int frame = 0;
PImage[] images = new PImage[numFrames];
 
void setup()
{
  size(200, 200);
  frameRate(30);
 
  images[0]  = loadImage("image1.jpg");
  images[1]  = loadImage("image2.jpg"); 
  images[2]  = loadImage("image3.jpg");
 
 
} 
 
void draw() 
{ 
  frame = (frame+1) % numFrames;  //Para crear el ciclo
  image(images[frame], 50, 50);
}

// *********************
// * UTILIZANDO TECLAS *
// *********************
color relleno;
 
void setup() {
  size(200, 200);
  noStroke();
  background(0);
  relleno = color(255,255,255);
}
void draw() { 
  fill(relleno);
  ellipse(100,100,50,80);
}
void keyPressed() {
 if (key == 'r')
  {
    relleno = color(255,0,0);
  }
  if(key == 'g')
  {
    relleno = color(0,255,0);
  }
  if(key == 'b')
  {
    relleno = color(0,0,255);
  }
}

// *********
// * MOUSE *
// *********
void setup() {
  size(200, 200);
  background(102);
  strokeWeight(10);
}
void draw() {
 
  if(mousePressed) {
    stroke(255);
  } else {
    stroke(0);
  }
 
  point(mouseX, mouseY); 
}

// *********************
// * EVENTOS DEL MOUSE *
// *********************
int tonoGris;
int tonoRojo;
int value;

void setup()
{
   size(400,400);
   tonoGris=126;
   value = 0;   
   tonoRojo = 128;
}

void draw() {
  fill(tonoGris);
  rect(25, 25, 50, 50);
  
  fill(tonoRojo,0,0);
  ellipse(200,100,80,200);
  
  fill(0,value,0);
  rect(300,300,50,50);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    tonoGris = 0;
  }  
  if (mouseButton == RIGHT) {
    tonoGris = 255;
  } 
}

void mouseMoved() {
  tonoRojo = tonoRojo + 5;
  if (tonoRojo > 255) {
    tonoRojo = 0;
  }
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}