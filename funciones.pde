void funciones () {
  if (estado=="basurero" && basura==true) {
    if (botones(104, 289, 470, 570)) {
      estado="humanoignora";
    }
    if (botones(508, 690, 470, 570)) {

      estado="finalfelizbasurero";
    }
  }
  if (estado=="finalfeliz" && feliz==true) {
    if (botones(44, 208, 440, 533)) {
      inicializarvariables();
    }
    if (botones(320, 480, 440, 533)) {
      estado="creditos";
    }
  }

  if (estado=="finalfelizbasurero" && finalbasurero==true) {
    if (botones(47, 213, 430, 525)) {
      inicializarvariables();
    }
    if (botones(300, 465, 430, 525)) {
      estado="creditos";
    }
  }
  if (estado=="finaltriste" && triste==true) {
    if (botones(57, 221, 430, 525)) {
      inicializarvariables();
    }
    if (botones(308, 474, 430, 525)) {
      estado="creditos";
    }
  }
  if (estado=="hacerruido" && ruido==true) {
    if (botones(165, 389, 436, 540)) {
      estado="humanodespierta";
    }
    if (botones(442, 668, 436, 540)) {
      estado="humanodespierta";
    }
  }
  if (estado=="humanodespierta" && despierta==true) {
    if (botones(104, 289, 471, 575)) {
      estado="finalfeliz";
    }
    if (botones(508, 693, 471, 575)) {
      estado="finaltriste";
    }
  }
  if (estado=="humanoignora" && ignora==true) {
    if (botones(104, 289, 471, 573)) {
      estado="hacerruido";
    }
    if (botones(508, 693, 471, 573)) {
      estado="salirabuscarcomida";
    }
  }
  if (estado=="puertacerrada" && puerta==true) {
    if (botones(104, 289, 470, 554)) {
      estado="humanoignora";
    }
    if (botones(508, 693, 470, 554)) {
      estado="salirabuscarcomida";
    }
  }
  if (estado=="quehacer1") {
    if (botones(113, 312, 467, 573)) {
      estado="humanoignora";
    }
    if (botones(500, 700, 467, 573)) {
      estado="salirabuscarcomida";
    }
  }
  if (estado=="salirabuscarcomida" && salir ==true) {
    if (botones(200, 355, 480, 560)) {
      estado="puertacerrada";
    }
    if (botones(440, 600, 480, 560)) {
      estado="basurero";
    }
  }
}
