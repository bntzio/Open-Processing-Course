
import ddf.minim.*;//importar libreria
import ddf.minim.ugens.*;

Minim minim;//declaracion de objeto minim
AudioOutput out;//declaracion de objeto AudioOutput
String note = ""; //crea una variable para después dibujar las notas en la pantalla


void setup()
{
  size(512, 200);
  
  minim = new Minim(this);//inicializacion del objeto minim (sonido)
  
  out = minim.getLineOut();//función para grabar output
  
  //out.setTempo( 80 );//fija el tiempo
  
  textSize(100);
  
}

void draw()
{
  background(0);
  stroke(255);
  text(note, 160, 130);
  
}

void keyPressed()
/*
out.playNote toca la nota que le pases como string
tambien puedes poner el tiempo de inicio y tiempo final out.playNote(0.0, 1.0, "C") inicio en 0, fin en 1
se puede tocar una frecuencia en vez de una nota out.playNote(0.0, 1.0, 134.9) inicio en 0, fin en 1, toca una nota con frecuencia de 134.9
*/ 
  {
   if(key == '1')//DO
   {
  out.playNote("C");
  note = "DO";
   }
  if(key == '2')//RE
  {
  out.playNote("D"); 
  note = "RE";
  }
  if(key == '3')//MI
  {
  out.playNote("E"); 
  note = "MI";
  }
  if(key == '4')//FA
  {
  out.playNote("F"); 
  note = "FA";
  }
  if(key == '5')//SOL
  {
  out.playNote("G");
  note = "SOL";
  }
  if(key == '6')//LA
  {
  out.playNote("A");
  note = "LA";
  }
  if(key == '7')//SI
  {
  out.playNote("B");
  note = "SI";
  }
  if(key == '8')//DO
  {
  out.playNote("C5");
  note = "DO";
  }
}

