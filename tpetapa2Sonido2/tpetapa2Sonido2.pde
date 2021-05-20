//--------------------------
//SONIDO
import oscP5.*;

boolean monitor = true;

float minimaIntensidad = 70;
float maximaIntensidad = 100; 

float minimaAltura = 45;
float maximaAltura = 70; 

float MINIMO_TRAZO = 3;
float MAXIMO_TRAZO = 20;

float maximoPico;

OscP5 osc;
GestorSenial intensidad;
GestorSenial altura;
float amp = 0;
float pitch = 0;

boolean antesHabiaSonido = false;
//--------------------------

//declaro un objeto
Dir_y_Vel dir;
Cadena estaCadena;
CaminanteBezier caminante;
GestorInteraccion g;
//paleta de colores
PGraphics textura;
PImage crayon;
//--------------------------
Paleta [] p;
//--------------------------
float esteRadio = 200;
float mouseSpeed;
int cant=0;
float var;

void setup() {
  //------------------------
  //SONIDO 
  osc = new OscP5(this, 12345);
  intensidad = new GestorSenial( minimaIntensidad, maximaIntensidad );
  altura = new GestorSenial( minimaAltura, maximaAltura );
  //--------------------------
  size( 500, 600 );
  //imagen para extraer paleta de colores//
  p = new Paleta[3];
  p[0]= new Paleta ("calidos.png");
  p[1]= new Paleta ("frios.png");
  p[2]= new Paleta ("fondo_1.png");

  //mouse
  g= new GestorInteraccion();
  dir = new Dir_y_Vel();
  // inicializa tanto las imagenes de textura como el color que varia dependiendo la paleta
  crayon = loadImage("crayon.png");
  textura = createGraphics(500, 600);

  // se dibuja un rect que simula el fondo
  textura.beginDraw();
  textura.background(p[2].darUnColor());
  textura.rect(0, 600, width, height);
  textura.endDraw();
  crayon.mask(textura);

  //----------------------------
  image(textura, 0, 0);
  image(crayon, 0, 0);
  strokeWeight(7);
  stroke(p[2].darUnColor());
  hacerCirculoBezier( esteRadio );
  maximoPico=0;
  //----------------------------
}

void draw() {
  //------------------------
  //SONIDO 
  //actualizo ingresando los nuevos valores
  intensidad.actualizar( amp );
  altura.actualizar( pitch );


  boolean haySonido = intensidad.filtradoNorm() > 0.2;

  //eventos de inicio y fin del sonido
  boolean empezoElSonido = haySonido && !antesHabiaSonido;
  boolean terminoElSonido = !haySonido && antesHabiaSonido;



  if (empezoElSonido) {
  }
  //if ((terminoElSonido) && 




  //estado de haber sonido
  if ( haySonido ) {
    if (pitch >= minimaIntensidad ) {
      caminante.asignarColor(p[0].darCalido()); //LE DAMOS LA PALETA DE CALIDOS
    } else if (pitch <= minimaIntensidad) {
      caminante.asignarColor(p[1].darFrio()); //LE DAMOS LA PALETA DE FRIOS
    }
  }
  /* if (terminoElSonido) {
   caminante.dibujarTrazo(maximoPico);
   }*/

  antesHabiaSonido = haySonido;

  //-----------------------------------
  if (( !caminante.activo)&& (cant<5)) {
    if (mouseX<= height/2 && mouseY <=height/2) {
      esteRadio +=40; //aumenta el radio de la proxima figura
      //aumenta el radio de la proxima figura
      hacerCirculoBezier( esteRadio ); //hace nueva figura con nuevo radio
      cant++;
    } else if (mouseX> height/2 && mouseY >height/2) {
      esteRadio -=40; //aumenta el radio de la proxima figura
      //aumenta el radio de la proxima figura
      hacerCirculoBezier( esteRadio ); //hace nueva figura con nuevo radio
      cant++;
    }
  }
  caminante.dibujar();
  caminante.avanzar();
  caminante.rebotar();
  g.actualizar();
  println("pitcvh" + pitch);
  //MODIFICA LOS COLORES SEGUN LOS MOVIMIENTOS DEL MOUSE EN BASE A SU VELOCIDAD

  /* if ( monitor ) {
   //muestra la señal en pantalla
   intensidad.imprimir(100, 100 );
   altura.imprimir(100, 250, 500, 100, false, true, false, false);
   }*/
}



void hacerCirculoBezier( float radioCirculo ) { 
  //inicializar el objeto
  estaCadena = new Cadena();

  for ( int i=0; i<15; i++ ) { //la figura tiene 10 curvas
    float radio = radioCirculo;
    //definir angulo de un giro completo
    float angulo = map( i, 0, 9, 0, radians(360) ); //la var i va de 0 a 9 (cada curva) tomando valores en un angulo de 360 grados
    println(angulo);
    float x = width/2 + radio * cos(angulo); //el width/2 hace que la figura se cierre
    float y = height/2 + radio * sin(angulo); //el height/2 hace que la figura se cierre

    estaCadena.click( x, y ); //añade la curva bezier a la figura
  }   

  Curva ultimo = estaCadena.lista.get( estaCadena.lista.size()-1 ); //toma la ultima curva
  Curva primero = estaCadena.lista.get(0); 

  ultimo.setAngulo2( primero.angulo1+PI ); //para que la nueva curva sea organica con el punto anterior

  caminante = new CaminanteBezier( estaCadena );//nueva curva
}
void  oscEvent (OscMessage m) {

  if (m.addrPattern().equals("/amp")) {
    amp = m.get(0).floatValue();
  } else if (m.addrPattern().equals("/pitch")) {
    pitch = m.get(0).floatValue();
  }
}
