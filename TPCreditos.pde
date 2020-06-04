int px, px2, px3, px4, py, py2, py3, py4;
float colorTexto, tinta, tinta2,colores;
PImage fondo, logo, pantalla2, pantalla3, pantalla4, pantalla5;
PFont fuente1, fuentegta;
void setup() {
  
  size(1066, 600);
  //INICIALIZO VARIABLES
  tinta=-50;
  tinta2=-150;
  //VALORES LEJANOS PARA QUE NO APAREZCAN EN LA PANTALLA
  px=714747;
  px2=3123124;
  px3=43741412;
  px4=431243;
  py=1458741;
  py2=4567455;
  py3=45464;
  py4=235258235;
  //CARGO IMAGENES Y FUENTES
  logo= loadImage("logo.png");
  pantalla2=loadImage("pantalla2.jpg");
  pantalla3=loadImage("pantalla3.jpg");
  pantalla4=loadImage("pantalla4.jpg");
  pantalla5=loadImage("pantalla5.jpg");
  PFont singPainterFont; 
  fuente1 = createFont("OPTIFleet.ttf",30); 
  fuentegta = createFont("Signatur.ttf", 45);
  noLoop();
}

void draw() {

  //PANTALLA1

  colores = map(tinta, 0, 240, -150, 255); //DEGRADE
  background(0);
  textFont(fuente1);
  tint(colores); 
  image(logo, 410, 190);
  fill(colores);
  text("THE END", 395, 520);
  colorTexto = map(tinta2,0,240,-150,255); //DEGRADE
  textSize(8);
  fill(colorTexto);
  text("PRESIONE CUALQUIER TECLA", 405,580);
  tinta++;
  tinta2++;
  textSize(80);
  
  // PANTALLA2
  image(pantalla2, 0, py); 
  textFont(fuentegta);
  fill(255);
  text("Art Director \n Aaron Garbut", px, 180);
  px=px-2;
  py--;
  //PANTALLA 3
  image(pantalla3, 0, py2);
  fill(255);
  text("Technical Directors \n Obbe Veimej \n Adam Fowler \n Alexander Roger \n Al Dukes", px2, 180);
  px2=px2-2;
  py2--;
  //PANTALLA 4
  image(pantalla4, 0, py3);
  text("Programming \n Andrew Greensmith \n Matthew Shepcar \n Neil Dodwel \n Ross Childs", px3, 180);
  px3=px3-2;
  py3--;
  //PANTALLA 5
  image(pantalla5, 0, py4);
  text("Rockstar Games \n Productions",px4,180);
  px4=px4-2;
  py4--;
}
void mousePressed() {
  loop();
}
void keyPressed() {
  background(0);
  //CREDITOS
  px=2000
  ;
  px2=3000;
  px3=4200;
  px4=5500;
  //IMAGENES
  py=600;
  py2=1200;
  py3=1800;
  py4=2400;
}
