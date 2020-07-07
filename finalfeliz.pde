void finalfeliz() {
  if (estado=="finalfeliz" && feliz==true) {
    if (mouseX >=44 && mouseX <= 208 && mouseY>=440 && mouseY <=533) {
      inicializarvariables();
    }
    if (mouseX >=320 && mouseX <=480 &&mouseY>=440 && mouseY <=533) {
      estado="creditos";
    }
  }
}
