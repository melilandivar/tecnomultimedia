void puertacerrada() {
  if (estado=="puertacerrada" && puerta==true) {
    if (mouseX >= 104 && mouseX <= 289 && mouseY>=470 && mouseY <=554) {
      estado="humanoignora";
    }
    if (mouseX > 508 && mouseX < 693 &&mouseY>=470 && mouseY <=554) {
      estado="salirabuscarcomida";
    }
  }
}
