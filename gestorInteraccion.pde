class GestorInteraccion {
  Dir_y_Vel mouse;
  boolean movGrande;
  boolean movPeq;
  float tiempoGrande;
  float tiempoPeq;


  GestorInteraccion() {
    mouse = new Dir_y_Vel();
  }

  void actualizar() {

    mouse.calcularTodo(mouseX, mouseY);
    movGrande=false;
    movPeq=false;
    tiempoGrande--;
    tiempoPeq--;
    tiempoGrande = constrain(tiempoGrande, 0, 90);
    tiempoPeq = constrain(tiempoPeq, 0, 90);

    if (mouse.velocidad()>10) {
      float umbral = 45;

      if (mouse.velocidad()>umbral) {
        if (tiempoPeq<10) {
          tiempoGrande+=10;
        }
      } else {
        if (tiempoGrande<10) {
          tiempoPeq+=10;
        }
      }
    }
    if (tiempoGrande>55) {

      movGrande=true;
    } 
    if (tiempoPeq>55) {
      movPeq= true;
    }
  }
}
