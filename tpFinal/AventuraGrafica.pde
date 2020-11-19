class AventuraGrafica {

  MiniGame miniGame;
  Fondos fondos;
  Resizable r;
  PFont fuente;
  boolean perdio, gano, basura, ignora, ruido, despierta, feliz, triste, puerta, salir, finalbasurero, comenzar;
  String estado;
  float px, py;



  boolean botones (float px1, float px2, float py1, float py2) { //FUNCION PARA VERIFICAR SI SE CLICKEO EN LA ZONA DEL BOTÓN
    if (mouseX >= px1 && mouseX <=px2 && mouseY>=py1 && mouseY <=py2) {
      return true;
    }
    return false;
  }



  AventuraGrafica() {
    inicializarvariables();
  }

  void dibujar_juego() { // VOID PARA DIBUJAR Y CAMBIAR ESCENAS DEL JUEGO
println(mouseX);
println(mouseY);
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

    if (estado.equals("main")) { // INICIO MINIJUEGO
      perdio=true;
      miniGame.inicializarVariables();
      miniGame.dibujarMenu(); // DIBUJAR MENU CON EXPLICACION
      if (mousePressed) {
        if (botones(r.valorX(320), r.valorX(485), r.valorY(388), r.valorY(488))) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE COMENZAR
          estado= "juego";
        }
      }
    }

    if (estado.equals("juego")) {  //COMIENZA MINIJUEGO
      perdio=true;
      miniGame.dibujarJuego();
    }

    if (miniGame.perderJuego()) { // PERDER MINIJUEGO
      if (perdio) {
        miniGame.pantallaPerder();
        estado= "perder";
      }
      if (mousePressed) {
        if (botones(r.valorX(420), r.valorX(580), r.valorY(380), r.valorY(440)) ) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE VOLVER A JUGAR
          miniGame.obstaculos.inicializarVar(); // SE INICIALIZAN LAS VARIABLES DEL MINIJUEGO
          estado= "main";
          perdio=false;
        }
        if (botones(r.valorX(230), r.valorX(380), r.valorY(400), r.valorY(440))) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE SALIR
          estado= "basurero"; //VUELVE A LA PANTALLA ANTERIOR
          perdio=false;
        }
      }
    }


    if (miniGame.ganarJuego()|| estado.equals("ganar")) { // GANAR MINIJUEGO
      if (gano) {
        estado= "ganar";
        miniGame.pantallaGanar();
      }
      if (mousePressed) {
        if (botones(r.valorX(420), r.valorX(580), r.valorY(380), r.valorY(440))) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE VOLVER A JUGAR
          miniGame.obstaculos.inicializarVar(); // SE INICIALIZAN LAS VARIABLES DEL MINIJUEGO
          estado= "main";
          gano=false;
        }
        if (botones(r.valorX(230), r.valorY(400), r.valorX(380), r.valorY(440))) { // VERIFICAR SI SE CLICKEO EL BOTÓN DE SALIR
          estado= "basurero"; //VUELVE A LA PANTALLA ANTERIOR
          gano=false;
        }
      }
    }
  }
  void cambiarEscena () { // VOID PARA VERIFICAR SI SE CLICKEO CON LA FUNCION DE BOTONES Y CAMBIAR EL VALOR DE LA VARIABLE ESTADO

    if (estado.equals("quehacer1")) {
      if (botones(r.valorX(110), r.valorX(310), r.valorY(470), r.valorY(570))) {
        estado="humanoignora";
      } 
      if (botones(r.valorX(500), r.valorX(700), r.valorY(470), r.valorY(570))) {
        estado="salirabuscarcomida";
      }
    }

    if (estado.equals("basurero") && basura==true) {
      if (botones(r.valorX(100), r.valorX(290), r.valorY(470), r.valorY(570))) {
        estado="humanoignora";
      }
      if (botones(r.valorX(500), r.valorX(700), r.valorY(470), r.valorY(570))) {

        estado="main";
      }
    }

    if (estado.equals("finalfeliz") && feliz==true) {
      if (botones(r.valorX(45), r.valorX(200), r.valorY(440), r.valorY(530))) {
        inicializarvariables();
      }
      if (botones(r.valorX(320), r.valorX(480), r.valorY(440), r.valorY(530))) {
        estado="creditos";
      }
    }

    if (estado.equals("finaltriste") && triste==true) {
      if (botones(r.valorX(60), r.valorX(220), r.valorY(440), r.valorY(530))) {
        inicializarvariables();
      }
      if (botones(r.valorX(310), r.valorX(475), r.valorY(440), r.valorY(530))) {
        estado="creditos";
      }
    }

    if (estado.equals("hacerruido") && ruido==true) {
      if (botones(r.valorX(160), r.valorX(390), r.valorY(440), r.valorY(540))) {
        estado="humanodespierta";
      }
      if (botones(r.valorX(490), r.valorX(690), r.valorY(440), r.valorY(540))) {
        estado="humanodespierta";
      }
    }

    if (estado.equals("humanodespierta") && despierta==true) {
      if (botones(r.valorX(100), r.valorX(290), r.valorY(470), r.valorY(570))) {
        estado="finalfeliz";
      }
      if (botones(r.valorX(510), r.valorX(690), r.valorY(470), r.valorY(570))) {
        estado="finaltriste";
      }
    }

    if (estado.equals("humanoignora") && ignora==true) {
      if (botones(r.valorX(100), r.valorX(290), r.valorY(470), r.valorY(570))) {
        estado="hacerruido";
      }
      if (botones(r.valorX(510), r.valorX(690), r.valorY(470), r.valorY(570))) {
        estado="salirabuscarcomida";
      }
    }

    if (estado.equals("puertacerrada") && puerta==true) {
      if (botones(r.valorX(100), r.valorX(290), r.valorY(470), r.valorY(550))) {
        estado="humanoignora";
      }
      if (botones(r.valorX(510), r.valorX(690), r.valorY(470), r.valorY(550))) {
        estado="salirabuscarcomida";
      }
    }

    if (estado.equals("salirabuscarcomida") && salir ==true) {
      if (botones(r.valorX(200), r.valorX(350), r.valorY(480), r.valorY(560))) {
        estado="puertacerrada";
      }
      if (botones(r.valorX(440), r.valorX(600), r.valorY(480), r.valorY(560))) {
        estado="basurero";
      }
    }
    if (estado.equals("creditos") ) {
      if (botones(r.valorX(200), r.valorX(520), r.valorY(520), r.valorY(550))) {
        inicializarvariables();
      }
    }
  }
  void inicializarvariables() { //VOID PARA INICIALIZAR LAS VARIABLES EN CASO DE VOLVER A JUGAR


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
    r = new Resizable ();
  }
}
