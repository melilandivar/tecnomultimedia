void humanoignora() {
  if (estado=="humanoignora" && ignora==true) {
    if (mouseX >= 104 && mouseX <=289 && mouseY>=471 && mouseY <=573) {
      estado="hacerruido";
    }
    if (mouseX >= 508 && mouseX <=693 && mouseY>=471 && mouseY <=573) {
      estado="salirabuscarcomida";
    }
  }
}
