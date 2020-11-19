class Obstaculos {

  float ox, oy, tam;
  PImage basurero;
  Resizable r;

  Obstaculos () {
    inicializarVar();
  }


  void colocarObstaculos() {
    image(basurero, r.valorX(ox), r.valorY(oy), r.valorX(tam), r.valorX(tam+20));
  }


  void avanzarObstaculos() {
    if (ox<0) {
      ox=r.valorX(800);
    }
    ox-=10;
  }
  void inicializarVar() {
    r= new Resizable ();
    tam = r.valorX(50);
    ox=r.valorX(800);
    oy=r.valorY(350);
    basurero = loadImage("g3.png");
  }
}
