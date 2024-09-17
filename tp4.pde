PImage [] imagenes = new PImage[11]; //arreglo para guardar las imagenes de fondo
String escena, estado;
boolean basura, ignora, ruido, despierta, feliz, triste, puerta, salir, finalbasurero;
int px, py;
PFont fuente;
void setup() {
  size(800, 600);
  inicializarvariables(); //funcion para inicializar variables
}
void draw() {
  println("estado es: " +estado);
  println(mouseX);
  println(mouseY);
  if (estado == "inicio" ) { 
    image(imagenes[0], 0, 0);
  }
  //CAMBIO DE ESTADO AUTOMÁTICO
  if (frameCount>120 && estado=="inicio") {  // cuenta 2 segs antes de cambiar
    estado = "quehacer1"; // pasa al estado presentación
  }
  if (estado == "quehacer1" ) { 
    image(imagenes[9], 0, 0);
  }
  if (estado == "humanoignora") {
    image(imagenes[4], 0, 0);
    ignora=true;
  }
  if (estado == "salirabuscarcomida" ) { 
    image(imagenes[10], 0, 0);
    salir=true;
  }
  if (estado == "puertacerrada" ) { 
    image(imagenes[5], 0, 0);
    puerta=true;
  }
  if (estado == "basurero" ) {
    image(imagenes[1], 0, 0);
    basura=true;
  }
  if (estado == "hacerruido") { 
    image(imagenes[2], 0, 0);
    ruido=true;
  }
  if (estado == "humanodespierta") { 
    image(imagenes[3], 0, 0);
    despierta=true;
  }
  if (estado == "finalfeliz") { 
    image(imagenes[7], 0, 0);
    feliz=true;
  }
  if (estado == "finaltriste") { 
    image(imagenes[6], 0, 0);
    triste=true;
  }
  if (estado == "finalfelizbasurero") { 
    image(imagenes[8], 0, 0);
    finalbasurero=true;
  }
  if (estado == "creditos") {
    background(0);
    fill(255);
    textSize(40);
    text("Alumna: Landivar, Melina \n Legajo: 85080/1 \n Comisión: 1 \n Tecnología Multimedial I \n Facultad de Artes", px, py);
    py--;
  }
}

boolean botones (int px1, int px2, int py1, int py2) { //FUNCION PARA VERIFICAR SI SE CLICKEO EN LA ZONA DEL BOTÓN
  if (mouseX >= px1 && mouseX <=px2 && mouseY>=py1 && mouseY <=py2) {
    return true;
  }
  return false;
}



void mousePressed() {
  funciones();
}
