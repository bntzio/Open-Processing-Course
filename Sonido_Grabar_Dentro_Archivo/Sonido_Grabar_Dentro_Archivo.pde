
import ddf.minim.*;//importa librería
import ddf.minim.ugens.*;

Minim         minim;//declaracion de objeto minim
AudioOutput   out;//declaracion de objeto AudioOutput
AudioRecorder recorder;//declaración de objeto AudioRecorder
String note = "";//crea una variable para después dibujar las notas en la pantalla

void setup()
{
  size(512, 200);
  
  minim = new Minim(this);//creación del objeto minim (sonidos)

  out = minim.getLineOut();//función para grabar output
  
  recorder = minim.createRecorder(out, "myrecording.wav");//graba el output a un archivo llamado myrecording.wav
  /*
  A diferencia del ejemplo para grabar audio con el micrófono de la computadora, este código graba todos
  los sonidos que produzca el programa en el archivo .wav. Cada sonido que se vaya produciendo se va a grabar en el archivo
  */
  
  textSize(30);
  
  
}

void draw()
{
  background(0); 
  stroke(255);
  
  if ( recorder.isRecording() )//Si estás grabando escribe "currently recording" en la coordenada 120, 100
  {
    text("Currently recording...", 120, 100);
  }
  else
  {
    text("Not recording.", 150, 100);//si no estás grabando escribe "not recording" en la coordenada 150, 100
  }
  text(note, 230, 140); 
}

void keyPressed()
{
  //declaración de las notas a tocar
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
  //fin de declaración de las notas a tocar
  
  if ( key == 'r' )  //si aprietas r
  {
    if ( recorder.isRecording() )//si ya estás grabando, cuando aprietes r deja de grabar 
    {
      recorder.endRecord();
    }
    else//si no estás grabando, cuando aprietes r empieza a grabar
    {
      recorder.beginRecord();
    }
  }
  
  if ( key == 's' )//si aprietas s
  {
    recorder.save();//guarda el archivo. Siempre guarda el archivo antes de cerrar el programa
    println("Done saving.");//te avisa que guardó (en la consola)
  }
}
