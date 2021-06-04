Figura f;
Cadena cadena, cadena2, cadena3, cadena4; //dos cadenas, 1 por caminante
Caminante caminante, caminante2, caminante3, caminante4; //dos caminantes, uno por bezier
//paleta de colores
PGraphics textura;
PImage crayon;
//--------------------------
Paleta p;

boolean b2, b3, b4; //boolean para controlar la segunda figura
void setup () {
  size(400, 600);
  //imagen para extraer paleta de colores//
  p = new Paleta();
 
  // inicializa tanto las imagenes de textura como el color que varia dependiendo la paleta
  crayon = loadImage("crayon.png");
  textura = createGraphics(500, 600);

  // se dibuja un rect que simula el fondo
  textura.beginDraw();
  textura.background(p.darFondo());
  textura.rect(0, 600, width, height);
  textura.endDraw();
  crayon.mask(textura);

  //----------------------------
  image(textura, 0, 0);
  tint(255, 127);  // Display at half opacity
  image(crayon, 0, 0);
  strokeWeight(7);
    stroke(p.darCalido());
  //inicializar objetos
  hacerBezier1(); //aca se hace el primero
}
void draw () {

  noFill();
  caminante.dibujar(); //dibuja el primero
  caminante.avanzar(); //avanza el primero
//  caminante.asignarColor(p[1].darFrio());
  if (frameCount>150) { //empieza el segundo
    if (b2==false) {
      hacerBezier2();
      b2=true;
    }  
 //   caminante3.asignarColor(p[0].darCalido());
    caminante2.dibujar();
    caminante2.avanzar();
    caminante2.rebotar();
  }
  if (frameCount>250) {
    if (b3==false) {
      hacerBezier3();
      b3=true;
    }  
  //  caminante3.asignarColor(p[1].darFrio());
    caminante3.dibujar();
    caminante3.avanzar();
    caminante3.rebotar();
    caminante3.cantidadPasos = 80;
  }
  if (frameCount>450) {
    if (b4==false) {
      hacerBezier4();
      b4=true;
    }  
  //  caminante4.asignarColor(p[1].darFrio());
    caminante4.dibujar();
    caminante4.avanzar();
  }
}
void mousePressed () {
  println("mouseX" + mouseX);
  println("mouseY" + mouseY);
}
void hacerBezier1() {
  cadena = new Cadena();
  cadena.click1();
  caminante = new Caminante (cadena);
}
void hacerBezier2() { //hace el segundo
  cadena2 = new Cadena();
  cadena2.click2();
  caminante2 = new Caminante (cadena2);
}
void hacerBezier3() { //hace el segundo
  cadena3 = new Cadena();
  cadena3.click3();
  caminante3 = new Caminante (cadena3);
}
void hacerBezier4() { //hace el segundo
  cadena4 = new Cadena();
  cadena2.click4();
  caminante4 = new Caminante (cadena4);
}
