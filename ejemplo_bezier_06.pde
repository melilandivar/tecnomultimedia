

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
  stroke(c.cambiarColor());

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

println("velocidad: " + g.mouse.velocidad());
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
  for ( int i=0; i<10; i++ ) { //la figura tiene 10 curvas
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

