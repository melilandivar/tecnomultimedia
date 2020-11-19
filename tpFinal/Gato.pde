class Gato {
  PImage gato;
  int tam;
  float px, py, vx, vy, ax, ay;
  boolean jump=false;

  Gato() {
    gato= loadImage("gato.png");
    tam=250;
    px= 100;
    py= 160;
    ax = 0; //VARIABLES PARA CONTROLAR EL SALTO DEL GATO
    ay = .32;
    vx = 0;
    vy = 0;
  }
  void dibujar() {
    
    vx+=ax;
    vy+=ay;
    px+=vx;
    py+=vy;

    if ( py > 180 ) {
      py =180;
      vy = 0;
      jump = true;
    } 
    image(gato, px, py, tam,tam+50);
  }

  void moverArriba() {
    if (jump) {
      vy=-10;
      jump=false;
    }
  }
}
