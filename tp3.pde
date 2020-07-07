PImage inicio, basurero, finalfeliz, finaltriste, finalfelizbasurero, hacerruido, humanodespierta, humanoignora, puertacerrada, quehacer1, salirabuscarcomida;
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
    image(inicio, 0, 0);
  }
  //CAMBIO DE ESTADO AUTOMÁTICO
  if (frameCount>120 && estado=="inicio") {  // cuenta 2 segs antes de cambiar
    estado = "quehacer1"; // pasa al estado presentación
  }
  if (estado == "quehacer1" ) { 
    image(quehacer1, 0, 0);
  }
  if (estado == "humanoignora") {
    image(humanoignora, 0, 0);
    ignora=true;
  }
  if (estado == "salirabuscarcomida" ) { 
    image(salirabuscarcomida, 0, 0);
    salir=true;
  }
  if (estado == "puertacerrada" ) { 
    image(puertacerrada, 0, 0);
    puerta=true;
  }
  if (estado == "basurero" ) {
    image(basurero, 0, 0);
    basura=true;
  }
  if (estado == "hacerruido") { 
    image(hacerruido, 0, 0);
    ruido=true;
  }
  if (estado == "humanodespierta") { 
    image(humanodespierta, 0, 0);
    despierta=true;
  }
  if (estado == "finalfeliz") { 
    image(finalfeliz, 0, 0);
    feliz=true;
  }
  if (estado == "finaltriste") { 
    image(finaltriste, 0, 0);
    triste=true;
  }
  if (estado == "finalfelizbasurero") { 
    image(finalfelizbasurero, 0, 0);
    finalbasurero=true;
  }
  if (estado == "creditos") {
    background(0);
    fill(255);
    textSize(40);
    text("Alumna: Landiva, Melina \n Legajo: 85080/1 \n Comisión: 1 \n Tecnología Multimedial I \n Facultad de Artes", px, py);
    py--;
  }
}
void mousePressed() {
  //FUNCIONES PARA CADA ESCENA
  quehacer1();
  salirabuscarcomida();
  humanoignora();
  hacerruido();
  humanodespierta();
  puertacerrada();
  comerbasura();
  finalfelizbasurero();
  finalfeliz();
  finaltriste();
}
