class MiniGame {

  int cantidad;
  float m;
  PImage perder, ganar;

  Gato gato;
  Obstaculos obstaculos;
  Main menu;

  MiniGame() {
    m=0.1;
    cantidad=0;
    gato = new Gato();
    menu= new Main();
    obstaculos= new Obstaculos();
    perder= loadImage("perder.png");
    ganar= loadImage("ganar.png");
  }

  void mainGame() {

    menu.dibujarMain();
    menu.comenzarJuego();
  }

  void dibujarJuego() {

    gato.dibujar();

    obstaculos.colocarObstaculos();
    obstaculos.avanzarObstaculos();


    ganarJuego();
    perderJuego();
    sumarPuntos();

    textSize(25);
    fill(255);
    text("Puntaje: " + cantidad, 100, 50);
  }


  void moverArriba(int tecla) {
    if (tecla== ENTER) {
      gato.moverArriba();
      salto.amp(m);
      salto.play();
    }
  }

  void perderJuego() {
    if ((obstaculos.ox<=gato.px) && (gato.py==180)) { //SI EL OBSTACULO SOBREPASA LA POSICION X DEL GATO, Y EL GATO NO SALTÓ(PY=180), SIGNIFICA QUE NO LO ESQUIVÓ Y PIERDE 
      estado="perder";
    }
  }


  void pantallaPerder() {

    image(perder, 207, 168);
  }

  void ganarJuego() {

    if (cantidad==15) {
      estado="ganar";
    }
  }
  void pantallaGanar() {
    image(ganar, 207, 168);
  }
  void sumarPuntos() {
    if ((obstaculos.ox<0 )) { //SI EL OBSTACULO SALE DE LA PANTALLA SIGNIFICA QUE FUE ESQUIVADO POR ENDE SUMA 1 PUNTO
      cantidad++;
    }
  }
}
