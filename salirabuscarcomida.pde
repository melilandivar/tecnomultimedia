void salirabuscarcomida() {
  if (estado=="salirabuscarcomida" && salir ==true) {
    if (mouseX >=200 && mouseX <=355 && mouseY>=480 && mouseY <=560) {
      estado="puertacerrada";
    }
    if (mouseX >=440 && mouseX <=600 && mouseY>=480 && mouseY <=560) {
      estado="basurero";
    }
  }
}
