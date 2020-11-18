class AventuraGrafica {
  MiniGame miniGame;
  Fondos fondos;
  PFont fuente;
  boolean perdio, gano, basura, ignora, ruido, despierta, feliz, triste, puerta, salir, finalbasurero, comenzar;
  String estado;


  boolean botones (float px1, float px2, float py1, float py2) { //FUNCION PARA VERIFICAR SI SE CLICKEO EN LA ZONA DEL BOTÓN
    if (mouseX >= px1 && mouseX <=px2 && mouseY>=py1 && mouseY <=py2) {
      return true;
    }
    return false;
  }



  AventuraGrafica() {
    inicializarvariables();
  }

  void dibujar_juego() {
    println(valorX(110));
    fondos.image_resizable(valorX(800), valorY(600));
    if (estado.equals("inicio" )) { 
      fondos.escena_inicio();
    }

    //CAMBIO DE ESTADO AUTOMÁTICO
    if (frameCount>120 && estado.equals("inicio")) {  // cuenta 2 segs antes de cambiar
      estado = "quehacer1"; // pasa al estado presentación
    }
    if (estado.equals( "quehacer1") ) { 
      fondos.escena_quehacer();
    }
    if (estado.equals( "humanoignora")) {
      fondos.escena_humanoignora();
      ignora=true;
    }
    if (estado.equals("salirabuscarcomida" )) { 
      fondos.escena_salirbuscarcomida();
      salir=true;
    }
    if (estado.equals( "puertacerrada" )) { 
      fondos.escena_puertacerrada();
      puerta=true;
    }
    if (estado.equals( "basurero" )) {
      fondos.escena_basurero();
      basura=true;
      miniGame.inicializarVariables();
    }
    if (estado.equals("hacerruido")) { 
      fondos.escena_hacerruido();
      ruido=true;
    }
    if (estado.equals("humanodespierta")) { 
      fondos.escena_humanodespierta();
      despierta=true;
    }
    if (estado.equals("finalfeliz")) { 
      fondos.escena_finalfeliz();
      feliz=true;
    }
    if (estado.equals("finaltriste")) { 
      fondos.escena_finaltriste();
      triste=true;
    }
    if (estado.equals("finalfelizbasurero")) { 
      fondos.escena_finalfelizbasurero();
      finalbasurero=true;
    }
    if (estado.equals("creditos")) {
      fondos.escena_creditos();
    }

    if (estado.equals("main")) {
      perdio=true;
      miniGame.inicializarVariables();
      miniGame.dibujarMenu(); // DIBUJAR MENU CON EXPLICACION
      if (mousePressed) {
        if (botones(320, 485, 388, 488)) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE COMENZAR
          estado= "juego";
        }
      }
    }

    if (estado.equals("juego")) {
      perdio=true;
      miniGame.dibujarJuego();
    }

    if (miniGame.perderJuego()) {
      if (perdio) {
        miniGame.pantallaPerder();
        estado= "perder";
      }
      if (mousePressed) {
        if (botones(valorX(420), valorY(580), valorX(380), valorY(440)) ) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE VOLVER A JUGAR
          miniGame.obstaculos.inicializarVar();
          estado= "main";
          perdio=false;
        }
        if (botones(valorX(230), valorY(400), valorX(380), valorY(440))) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE SALIR
          estado= "basurero";
          perdio=false;
        }
      }
    }


    if (miniGame.ganarJuego()|| estado.equals("ganar")) {
      if (gano) {
        estado= "ganar";
        miniGame.pantallaGanar();
      }
      if (mousePressed) {
        if (botones(valorX(420), valorY(580), valorX(380), valorY(440))) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE VOLVER A JUGAR
          estado= "main";
          gano=false;
        }
        if (botones(valorX(230), valorY(400), valorX(380), valorY(440))) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE SALIR
          estado= "basurero";
          gano=false;
        }
      }
    }
  }
  void cambiarEscena () {

    if (estado.equals("quehacer1")) {
      if (botones(valorX(110), valorX(460), valorY(310), valorY(570))) {
        estado="humanoignora";
      } 
      if (botones(valorX(500), valorX(460), valorY(700), valorY(570))) {
        estado="salirabuscarcomida";
      }
    }

    if (estado.equals("basurero") && basura==true) {
      if (botones(valorX(100), valorX(470), valorY(290), valorY(570))) {
        estado="humanoignora";
      }
      if (botones(valorX(500), valorX(460), valorY(700), valorY(570))) {

        estado="main";
      }
    }

    if (estado.equals("finalfeliz") && feliz==true) {
      if (botones(valorX(40), valorX(440), valorY(200), valorY(530))) {
        inicializarvariables();
      }
      if (botones(valorX(320), valorX(440), valorY(480), valorY(533))) {
        estado="creditos";
      }
    }

    if (estado.equals("finalfelizbasurero") && finalbasurero==true) {
      if (botones(valorX(50), valorX(430), valorY(210), valorY(520))) {
        inicializarvariables();
      }
      if (botones(valorX(300), valorX(430), valorY(465), valorY(520))) {
        estado="creditos";
      }
    }

    if (estado.equals("finaltriste") && triste==true) {
      if (botones(valorX(60), valorX(430), valorY(220), valorY(520))) {
        inicializarvariables();
      }
      if (botones(valorX(310), valorX(430), valorY(480), valorY(520))) {
        estado="creditos";
      }
    }

    if (estado.equals("hacerruido") && ruido==true) {
      if (botones(valorX(160), valorX(460), valorY(700), valorY(570))) {
        estado="humanodespierta";
      }
      if (botones(valorX(440), valorX(430), valorY(670), valorY(540))) {
        estado="humanodespierta";
      }
    }

    if (estado.equals("humanodespierta") && despierta==true) {
      if (botones(valorX(100), valorX(470), valorY(290), valorY(570))) {
        estado="finalfeliz";
      }
      if (botones(valorX(510), valorX(470), valorY(690), valorY(570))) {
        estado="finaltriste";
      }
    }

    if (estado.equals("humanoignora") && ignora==true) {
      if (botones(valorX(100), valorX(290), valorY(470), valorY(570))) {
        estado="hacerruido";
      }
      if (botones(valorX(510), valorX(690), valorY(470), valorY(570))) {
        estado="salirabuscarcomida";
      }
    }

    if (estado.equals("puertacerrada") && puerta==true) {
      if (botones(valorX(100), valorX(290), valorY(470), valorY(550))) {
        estado="humanoignora";
      }
      if (botones(valorX(510), valorX(690), valorY(470), valorY(550))) {
        estado="salirabuscarcomida";
      }
    }

    if (estado.equals("salirabuscarcomida") && salir ==true) {
      if (botones(valorX(200), valorX(350), valorY(480), valorY(560))) {
        estado="puertacerrada";
      }
      if (botones(valorX(440), valorX(600), valorY(480), valorY(560))) {
        estado="basurero";
      }
    }
  }
  void inicializarvariables() {


    fuente= createFont("Rockwell-48.vlw", 60);
    basura=false;
    ignora=false;
    ruido=false;
    despierta=false;
    puerta=false;
    feliz=false;
    triste=false;
    salir=false;
    estado="inicio";
    fondos = new Fondos();
    perdio=true;
    gano=true;
    miniGame = new MiniGame();
  }

  float valorX (float valor) {
    return map(valor, 0, 800, 0, width);
  }

  float valorY  (float valor) {
    return map(valor, 0, 600, 0, height);
  }
}
