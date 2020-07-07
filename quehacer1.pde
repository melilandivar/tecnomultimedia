void quehacer1() {
  if (estado=="quehacer1") {
    if (mouseX >= 113 && mouseX <= 312 && mouseY>=467 && mouseY <=573) {
      estado="humanoignora";
    }
    if (mouseX >= 500 && mouseX <= 700 && mouseY>=467 && mouseY <=573) {
      estado="salirabuscarcomida";
    }
  }
}
