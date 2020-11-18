class Obstaculos {

  float ox, oy, tam;
  PImage basurero;

  Obstaculos () {
    inicializarVar();
  }


  void colocarObstaculos() {
    image(basurero, ox, oy, tam, tam+20);
  }


  void avanzarObstaculos() {
    if (ox<0) {
      ox=800;
    }
    ox-=10;
  }
  void inicializarVar() {
    tam = 50;
    ox=800;
    oy=350;
    basurero = loadImage("g3.png");
  }
}
