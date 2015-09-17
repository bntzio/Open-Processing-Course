
import ddf.minim.*;//importar librería

Minim minim;//declaración de objeto Minim
AudioInput in;//declaración de objeto AudioInput
AudioRecorder recorder;//declaración de objeto AudioRecorder

void setup()
{
  size(512, 200);
  
  minim = new Minim(this);//creación del objeto minim (sonidos)

  in = minim.getLineIn();//función para leer un input

  recorder = minim.createRecorder(in, "grabacion.wav");//recorder guarda el input en el archivo myrecording.wav
  
  textSize(30);//tamaño de letra
}

void draw()
{
  background(0); 
  stroke(255);

  if ( recorder.isRecording() )//Si estás grabando escribe "currently recording" en la coordenada 120, 100
  {
    text("Currently recording...", 120, 100);
  }
  else//si no estás grabando escribe "not recording" en la coordenada 150, 100
  {
    text("Not recording.", 150, 100);
  }
}

void keyPressed()
{
  if ( key == 'r' ) //si aprietas r
  {
    if ( recorder.isRecording() )//si ya estás grabando, cuando aprietes r deja de grabar
    {
      recorder.endRecord();
    }
    else //si no estás grabando, cuando aprietes r empieza a grabar
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
