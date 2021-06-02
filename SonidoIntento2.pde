Figura f;
Cadena cadena, cadena2; //dos cadenas, 1 por caminante
Caminante caminante, caminante2; //dos caminantes, uno por bezier
boolean b2; //boolean para controlar la segunda figura
void setup () {
  size(500, 600);

  //inicializar objetos
  hacerBezier1(); //aca se hace el primero
}
void draw () {

  noFill();
  caminante.dibujar(); //dibuja el primero
  caminante.avanzar(); //avanza el primero
  if (frameCount>150) { //empieza el segundo
    if (b2==false) {
      hacerBezier2();
      b2=true;
    } 
    caminante2.dibujar();
    caminante2.avanzar();
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
