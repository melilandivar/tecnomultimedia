class MiniGame {

  int cantidad, vidas;
  float m, px, py;
  PImage perder, ganar, menu, fondo, vida;
  boolean sumar;
  Resizable r;
  Gato gato;
  Obstaculos obstaculos;


  MiniGame() {
    inicializarVariables();
  }
  void inicializarVariables() {
    vidas=30;
    m=0.1;
    cantidad=0;
    gato = new Gato();
    menu = loadImage("menu.png");
    obstaculos= new Obstaculos();
    perder= loadImage("perder.png");
    ganar= loadImage("ganar.png");
    fondo = loadImage("fondo.png");
    vida = loadImage("vida.png");
    sumar=true;
    r= new Resizable();
  }

  void dibujarMenu() {
    image (fondo, r.valorX(0),r.valorY (0),r.valorX(800),r.valorY (600));
    image (menu, r.valorX(207), r.valorY(168),r.valorX(400),r.valorY(300));
  }

  void dibujarJuego() {

    image(fondo, r.valorX(0),r.valorY (0),r.valorX(800),r.valorY (600));
    gato.dibujar();

    obstaculos.colocarObstaculos();
    obstaculos.avanzarObstaculos();

    sumarPuntos();
    perderVidas();

    textSize(25);
    fill(255);
    text("Puntaje: " + cantidad, r.valorX(50), r.valorY(50));

    //CALCULAR LAS VIDAS PORQUE EN EL VOID SE RESTAN DE A 12 PUNTOS
    if (vidas==30) {
      image(vida, r.valorX(340), r.valorY(20), r.valorX(50), r.valorY(50));
      image(vida, r.valorX(400), r.valorY(20), r.valorX(50), r.valorY(50));
      image(vida, r.valorX(460), r.valorY(20), r.valorX(50), r.valorY(50));
    }
    if (vidas==18) {
      image(vida, r.valorX(340), r.valorY(20), r.valorX(50), r.valorY(50));
      image(vida, r.valorX(400), r.valorY(20), r.valorX(50), r.valorY(50));
    }
    if (vidas==6) {
      image(vida, r.valorX(340), r.valorY(20), r.valorX(50), r.valorY(50));
    }
    text("Vidas: ", r.valorX(250), r.valorY(50));
  }


  void moverArriba(int tecla) {
    if (tecla== ENTER) {
      gato.moverArriba();
      salto.amp(m);
      salto.play();
    }
  }
  void perderVidas() {
    if ((obstaculos.ox<=gato.px) && (gato.py==180)) {
      image(fondo, r.valorX(0), r.valorY(0));
      vidas-=1;
      sumar=false;
    } else {
      sumar=true;
    }
  }
  boolean perderJuego () {
    if (vidas== 0) { //SI EL OBSTACULO SOBREPASA LA POSICION X DEL GATO, Y EL GATO NO SALTÓ(PY=180), SIGNIFICA QUE NO LO ESQUIVÓ Y PIERDE 
      return true;
    } else 
    return false;
  }

  void sumarPuntos() {
    if ((obstaculos.ox<0 )&& sumar == true) { //SI EL OBSTACULO SALE DE LA PANTALLA SIGNIFICA QUE FUE ESQUIVADO POR ENDE SUMA 1 PUNTO
      cantidad++;
    }
  }

  boolean ganarJuego () {
    if ((cantidad==15)) {
      return true;
    } else 
    return false;
  }

  void pantallaPerder() {

    image(perder, r.valorX(207), r.valorY(168));
  }

  void pantallaGanar() {
    image(ganar,r.valorX(207), r.valorY(168));
  }
}
