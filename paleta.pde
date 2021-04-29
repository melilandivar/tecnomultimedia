//ARRAY CALIDOS
color [] calidos = {#f15a19, #c42a2a, #dbbe09};
//ARRAY FRIOS
color [] frios = {#275a5e, #617743, #5b505c};

class Paleta {

  PImage imagen;
  Paleta( String nombre ) {
    imagen = loadImage( nombre );
  }

  color darCalido() { //RETORNA UN COLOR AL AZAR DEL ARREGLO
    return calidos[int(random(3))];
  }
  color darFrio() { //RETORNA UN COLOR AL AZAR DEL ARREGLO
    return frios[int(random(3))];
  }

  color cambiarColor() { //DEPENDE LA VELOCIDAD DEL MOUSE CAMBIA DE COLOR
    mouseSpeed =  dist(mouseX, mouseY, pmouseX, pmouseY);
    if (mouseSpeed > 50) {
      return darCalido();
    } else {
      return darFrio();
    }
  }


  color darUnColor() {
    int posX = int( random( imagen.width ));
    int posY = int( random( imagen.height ));
    return imagen.get( posX, posY );
  }

  color darUnColor( float alfa ) {
    int posX = int( random( imagen.width ));
    int posY = int( random( imagen.height ));
    color este = imagen.get( posX, posY ); 
    return color( red(este), green(este), blue(este), alfa );
  }
}
