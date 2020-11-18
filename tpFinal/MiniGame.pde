class MiniGame {

  int cantidad, vidas;
  float m;
  PImage perder, ganar, menu, fondo, vida;
  boolean sumar;

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
  }

  void dibujarMenu() {
    image (fondo, 0, 0);
    image (menu, 207, 168);
  }

  void dibujarJuego() {

    image(fondo, 0, 0);
    gato.dibujar();

    obstaculos.colocarObstaculos();
    obstaculos.avanzarObstaculos();

    sumarPuntos();
    perderVidas();

    textSize(25);
    fill(255);
    text("Puntaje: " + cantidad, 50, 50);

    //CALCULAR LAS VIDAS PORQUE EN EL VOID SE RESTAN DE A 12 PUNTOS
    if (vidas==30) {
      image(vida, 340, 20, 50, 50);
      image(vida, 400, 20, 50, 50);
      image(vida, 460, 20, 50, 50);

    }
    if (vidas==18) {
      image(vida, 340, 20, 50, 50);
      image(vida, 400, 20, 50, 50);
    }
    if (vidas==6) {
      image(vida, 340, 20, 50, 50);
    }
    text("Vidas: ", 250, 50);
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
      image(fondo,0,0);
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

    image(perder, 207, 168);
  }

  void pantallaGanar() {
    image(ganar, 207, 168);
  }
}
