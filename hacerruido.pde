void hacerruido() {
  if (estado=="hacerruido" && ruido==true) {
    if (mouseX >= 165 && mouseX <= 389 && mouseY>=436 && mouseY <=540) {
      estado="humanodespierta";
    }
    if (mouseX >= 442 && mouseX <= 668 && mouseY>=436 && mouseY <=540) {
      estado="humanodespierta";
    }
  }
}
