void finaltriste(){
  if (estado=="finaltriste" && triste==true){
    if (mouseX >=57 && mouseX <=221 && mouseY>=430 && mouseY <=525) {
      inicializarvariables();
    }
    if (mouseX >=308 && mouseX <=474 && mouseY>=430 && mouseY <=525) {
      estado="creditos";
    }
  }
}
