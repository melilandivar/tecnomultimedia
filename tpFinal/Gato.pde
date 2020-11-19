class Gato {
  PImage gato;
  float tam;
  float px, py, vx, vy, ax, ay;
  boolean jump=false;
  Resizable r;

  Gato() {
    r= new Resizable ();
    gato= loadImage("gato.png");
    tam=250;
    px= 100;
    py=160;
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

    if ( py > r.valorY(180) ) {
      py =r.valorY(180);
      vy = r.valorY(0);
      jump = true;
    } 
    image(gato, r.valorX(px), r.valorY(py), r.valorX(tam),r.valorX(tam+50));
  }

  void moverArriba() {
    if (jump) {
      vy=-10;
      jump=false;
    }
  }
}
