//declaracion del objeto
PImage fondo;
PGraphics graficos; 
Circulo c;

int cant = 4;  



void setup () {

  size(420, 600);
 
  fondo = loadImage("fondo.jpg");
  c = new Circulo() ; //dimesion del arreglo 

  
}

void draw () {
  background(fondo);
  c.dibujar();
  }
  void mousePressed(){

   c.agrandar();
}
  
