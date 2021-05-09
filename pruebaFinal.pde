
PGraphics textura;
PImage crayon;
Caminante caminante [];
GestorInteraccion g;

Paleta  f; //COLORES FRIOS
Paleta c; //COLORES CALIDOS
Paleta pf; //FONDO

color col;
float mouseSpeed;
int cantidadlineas;


void setup() {
  size(500, 600);

  //cdad de trazos//
  cantidadlineas=4;
  caminante = new Caminante [cantidadlineas];

  g= new GestorInteraccion();

  //imagen para extraer paleta de colores//
  f = new Paleta("frios.png");
  c = new Paleta("calidos.png");
  pf = new Paleta("fondo.png");

  //velocidad del mouse




  for ( int i=0; i<cantidadlineas; i++ ) {
    caminante[i] = new Caminante();
    caminante[i].asignarColor(c.cambiarColor());
   // caminante[i].asignarColor(c.darUnColor(o));
  }


  // inicializa tanto las imagenes de textura como el color que varia dependiendo la paleta

  crayon = loadImage("crayon.png");
  textura = createGraphics(500, 600);

  // se dibuja un rect que simula el fondo

  textura.beginDraw();
  textura.background(pf.darUnColor());
  textura.rect(0, 600, width, height);
  textura.endDraw();
  crayon.mask(textura);

  image(textura, 0, 0);
  image(crayon, 0, 0);
}
void draw() {





  for (int i=0; i<cantidadlineas; i++) {
    caminante[i].dibujar();
    caminante[i].mover();
    caminante[i].rebotes();
    caminante[i].actualizar();
    g.actualizar(); //ACTUALIZA LOS PARAMETROS

    //MODIFICA LOS COLORES SEGUN LOS MOVIMIENTOS DEL MOUSE EN BASE A SU VELOCIDAD
    if (g.movGrande) {
      caminante[i].asignarColor(c.darCalido()); //LE DAMOS LA PALETA DE CALIDOS
    } else if (g.movPeq) {
      caminante[i].asignarColor(c.darFrio()); //LE DAMOS LA PALETA DE FRIOS
    }
  }
} 
