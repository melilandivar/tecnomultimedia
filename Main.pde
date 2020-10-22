class Main {
  PImage menu;
  
  Main() {
    menu= loadImage("menu.png");
  }
  
  void dibujarMain() {
    image(menu, 207, 168);
  }
  
  void comenzarJuego() {
    if (mousePressed) {
      if (mouseX>=320 && mouseX<=485 && mouseY >=388 && mouseY<=448) {
        estado="juego";
      } 
    }
  }
  
  //ESTAS FUNCIONES ESTARAN DISPONIBLES CON LA AVENTURA GRAFICA
 /* void volverJugar() {
    if (mousePressed) {
      if (mouseX>=417 && mouseX<=582 && mouseY >=386 && mouseY<=444) {
        estado="juego";

      }
    }
  }
   void salirJuego() { 
   if (mousePressed) {
   if (mouseX>=322 && mouseX<=491 && mouseY >=385 && mouseY<=446) {
   estado="basurero";
   }
   }
   }*/
}
