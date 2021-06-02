class Caminante {

  //-------------------------
  Cadena cadena;

  int cantidadPasos = 100; //velocidad
  int paso = 0; //por que curva voy
  int contTramo = 0; //cual es el tramo de curva
  float antesX = -1;
  float antesY = -1;
  //colores
  color col;
  PGraphics w;   // caminantes
  PImage cw;     // textura caminantes

  // sonido
  float x, y; 
  float t;

  float dir, vel;
  float anguloBase;



  boolean activo = true;


  Caminante( Cadena cadena_ ) {
    //  p= new Paleta("fondo_1.png");
    cadena = cadena_;
    //  cw = loadImage("textura_linea.png");
    //  w = createGraphics(500, 600);
    //   col= p.darUnColor();
    vel=15;
    t=20;
  }
  void avanzar() {
    paso++;
    //si se llega al ult punto de la curva se reinicia para arrancar nueva curva
    if ( paso>cantidadPasos ) {
      paso = 0;
      contTramo++; //aumenta la cantidad de curvas realizadas
    }
  }
  //------------------------------------

  void dibujar() {
    //pregunta si aún existen curvas que dibujar
    if ( contTramo < cadena.lista.size() ) {

      //pide la curva en la que está actualmente parado
      Curva c = cadena.lista.get(contTramo);
      //calcula la posición dentro de la curva
      float pos = map( paso, 0, cantidadPasos, 0.0, 1.0 );
      //obtiene las dos coordenadas del punto de bezier
      float esteX = bezierPoint(c.x1, c.x2, c.x3, c.x4, pos);
      float esteY = bezierPoint(c.y1, c.y2, c.y3, c.y4, pos);
      //para que no arranque en cualquier lado
      if ( antesX!=-1 ) {

        strokeWeight(5);

        line( antesX, antesY, esteX, esteY );
      }

      antesX = esteX;
      antesY = esteY;
    } else {
      activo = false;
    }
  }
}
