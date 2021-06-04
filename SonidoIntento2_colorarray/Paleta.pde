ArrayList<ColorContainer> listC = new ArrayList();
import java.util.ArrayList;
import java.util.Random;
//ARRAY CALIDOS
color [] colores = {#d25b17, #e7bc4b, #942720, #1e2744, #304e34, #68494f};
color [] calidos = {#d25b17, #e7bc4b, #942720};
//ARRAY FRIOS
color [] frios = {#1e2744, #304e34, #68494f};

//PALETA FONDO

color [] fondo = {#c63435, #ec603c, #ffc13c, #4c6045, #264468, #41415b};
Random randomGenerator;
class Paleta {

  PImage imagen;
  Paleta( ) {

    listC.add(new ColorContainer(#d25b17));
    listC.add(new ColorContainer(#e7bc4b));
    listC.add(new ColorContainer(#942720));
    listC.add(new ColorContainer(#1e2744));
    listC.add(new ColorContainer(#304e34));
    listC.add(new ColorContainer(#68494f));
  }

  void eliminar (color col) {
    listC.remove(new ColorContainer (col));
  }
  color darColor() {
    ColorContainer index = randomGenerator.nextInt(listC.size());
   
    return  index= listC.get(index);
  }

  color darCalido() { //RETORNA UN COLOR AL AZAR DEL ARREGLO
    return calidos[int(random(3))];
  }
  color darFrio() { //RETORNA UN COLOR AL AZAR DEL ARREGLO
    return frios[int(random(3))];
  }

  color darFondo() {
    return fondo[int(random(6))];
  }
}
/*color darUnColor() {
 int posX = int( random( imagen.width ));
 int posY = int( random( imagen.height ));
 return imagen.get( posX, posY );
 }
 
 color darUnColor( float alfa ) {
 int posX = int( random( imagen.width ));
 int posY = int( random( imagen.height ));
 color este = imagen.get( posX, posY ); 
 return color( red(este), green(este), blue(este), alfa );
 }*/
