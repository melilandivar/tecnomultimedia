
//declaro un objeto
Dir_y_Vel dir;
Cadena estaCadena;
CaminanteBezier caminante;
GestorInteraccion g;
//paleta de colores
PGraphics textura;
PImage crayon;
//--------------------------
Paleta  f; //COLORES FRIOS
Paleta c; //COLORES CALIDOS
Paleta pf; //FONDO
//--------------------------
float esteRadio = 200;
float mouseSpeed;
int cant=0;
void setup() {

  size( 500, 600 );
  //imagen para extraer paleta de colores//
  f = new Paleta("frios.png");
  c = new Paleta("calidos.png");
  pf = new Paleta("fondo_1.png");

  //mouse
  g= new GestorInteraccion();
  dir = new Dir_y_Vel();
  // inicializa tanto las imagenes de textura como el color que varia dependiendo la paleta
  crayon = loadImage("crayon.png");
  textura = createGraphics(500, 600);

  // se dibuja un rect que simula el fondo
  textura.beginDraw();
  textura.background(pf.darUnColor());
  textura.rect(0, 600, width, height);
  textura.endDraw();
  crayon.mask(textura);

  //----------------------------
  image(textura, 0, 0);
  image(crayon, 0, 0);

  //----------------------------
  strokeWeight(7);
  stroke(c.darFrio());

  hacerCirculoBezier( esteRadio );
}

void draw() {
  println("cant: " + cant);
  esteRadio=random(100, 300);
  if (( !caminante.activo )&& (cant<5)) { //si se termino una figura
    esteRadio =random(100,300); //aumenta el radio de la proxima figura
    hacerCirculoBezier( esteRadio ); //hace nueva figura con nuevo radio
    strokeWeight(7);
    stroke(c.darCalido());
    cant++;
  }


  caminante.dibujar();
  caminante.avanzar();
  g.actualizar();

  //MODIFICA LOS COLORES SEGUN LOS MOVIMIENTOS DEL MOUSE EN BASE A SU VELOCIDAD
  if (g.movGrande) {
    caminante.asignarColor(c.darCalido()); //LE DAMOS LA PALETA DE CALIDOS
  } else if (g.movPeq) {
    caminante.asignarColor(c.darFrio()); //LE DAMOS LA PALETA DE FRIOS
  }
}


void hacerCirculoBezier( float radioCirculo ) { 
  //inicializar el objeto
  estaCadena = new Cadena();
  for ( int i=0; i<8; i++ ) {
    float radio = radioCirculo;
    //definir angulo de un giro completo
    float angulo = map( i, 0, 7, 0, radians(360) );
    println(angulo);
    float x = width/2 + radio * cos(angulo);
    float y = height/2 + radio * sin(angulo);
    /*  if (x + radio > 500 || x + radio < 0) {  INTENTO FALLIDO DE QUE REBOTE EN LOS COSTADOS F
     x = random(100, 400) + radio * cos( angulo );
     }
     if ((y + radio > 600 || y + radio < 0)) {
     y = random(100, 500) + radio * sin( angulo );*/
    //    println("x: " + x);
    //  println("y: " + y);  
    estaCadena.click( x, y );
  }
  Curva ultimo = estaCadena.lista.get( estaCadena.lista.size()-1 );
  Curva primero = estaCadena.lista.get(0);

  ultimo.setAngulo2( primero.angulo1+PI );

  caminante = new CaminanteBezier( estaCadena );
}

