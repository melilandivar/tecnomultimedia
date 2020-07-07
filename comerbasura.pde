void comerbasura() {
  if (estado=="basurero" && basura==true) {
    if (mouseX >= 104 && mouseX <=289 && mouseY>=470 && mouseY <=570) {
      estado="humanoignora";
    }
    if (mouseX > 508 && mouseX < 693 && mouseY>=470 && mouseY <=570) {
      estado="finalfelizbasurero";
    }
  }
}
