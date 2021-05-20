float TAMANIO_RADIO = random(100,300);
CaminanteBezier c;

class Cadena {

  ArrayList <Curva> lista; //guarda objetos curva
  float x, y;
  String estado;
  int cant=0;

  Cadena() {
    lista = new ArrayList(6);
    estado = "espera";
  }

  //---------------------------------------

  void click( float x_, float y_ ){
      if ( estado.equals( "espera" ) ) { //genera dos puntos x e y
        x = x_;
        y = y_;
        estado = "primero";
      } else if ( estado.equals( "primero" ) ) { //genera dos puntos de control
        Curva curva = new Curva( x, y, x_, y_, TAMANIO_RADIO );
        lista.add( curva );
        estado = "siguientes";
        x = x_;
        y = y_;
      } else if ( estado.equals( "siguientes" ) ) { //genera el siguiente punto y punto de control(1 solo) porque toma el anterior(180gr) 
        //tomar la última curva de la lista
        Curva ultimo = lista.get( lista.size()-1 );
        //crear la nueva curva      
        Curva curva = new Curva( x, y, x_, y_, TAMANIO_RADIO );
        //va a definir el angulo del punto de control P2 de la nuevas curva
        //en función del angulo del punto P3 de la última curva
        //y le va a sumar PI (que son 180º en radians)
        curva.setAngulo1( ultimo.angulo2+PI);
        //agregar la nueva curva a la lista
        lista.add( curva );
        //guarda el ultimo punto para crear la siguiente curav
        x = x_;
        y = y_;
      } 
      Curva curva = new Curva( x, y, x_, y_, TAMANIO_RADIO );
      curva.rebotes(x,y);
     

}
}
