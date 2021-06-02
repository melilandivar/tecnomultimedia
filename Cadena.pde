class Cadena {

  ArrayList <Curva> lista;
  ArrayList <Curva> lista2;
  float x, y;
  String estado;

  Cadena () {

    lista = new ArrayList();
    lista2 = new ArrayList();
  }

  void click1 () { //MUUUUUCHO CODIGO QUE TODAVÍA NO SE COMO REDUCIRLO 
    Curva curva = new Curva(100, 120, 80, 0, 400, 20, 300, 150 );
    lista.add( curva );   
    curva = new Curva( 300, 150, 100, 240, 450, 190, 480, 220);
    lista.add( curva );
    curva = new Curva( 480, 220, 500, 320, 440, 240, 414, 285);
    lista.add( curva );
    curva = new Curva( 414, 285, 400, 306, 366, 498, 420, 530);
    lista.add( curva );
    curva = new Curva( 420, 530, 499, 592, 450, 597, 350, 597);
    lista.add( curva );
    curva = new Curva( 350, 597, 300, 593, 366, 551, 300, 550);
    lista.add( curva );
    curva = new Curva( 300, 550, 240, 560, 61, 594, 30, 550);
    lista.add( curva );
    curva = new Curva(30, 550, 2, 468, 81, 565, 80, 500);
    lista.add( curva );
    curva = new Curva( 80, 500, 91, 400, 157, 487, 190, 450);
    lista.add( curva );
    curva = new Curva( 190, 450, 246, 332, 183, 312, 150, 350);
    lista.add( curva );
    curva = new Curva( 150, 350, 120, 385, 73, 423, 44, 370);
    lista.add( curva );
    curva = new Curva( 44, 370, 2, 250, 128, 288, 155, 260);
    lista.add( curva );
    curva = new Curva( 155, 260, 190, 220, 226, 343, 280, 300);
    lista.add( curva );
    curva = new Curva( 280, 300, 357, 226, 265, 220, 240, 220);
    lista.add( curva );
    curva = new Curva( 240, 220, 57, 220, 120, 238, 100, 120);
    lista.add( curva );

  }
  void click2 () {
    //---------------------------- SEGUNDA FIGURA
    Curva curva = new Curva(375, 75, 453, 4, 490, 9, 499, 50);
    lista.add( curva );   
    curva = new Curva(499, 50, 490, 320, 490, 9, 360, 200);
    lista.add( curva );
    curva = new Curva(360, 200, 275, 357, 426, 165, 490, 400);
    lista.add( curva );
    curva = new Curva( 490, 400, 494, 504, 131, 553, 338, 558);
    lista.add( curva );
    curva = new Curva( 338, 558, 473, 568, 4, 620, 38, 579);
    lista.add( curva );
    curva = new Curva( 38, 579, 316, 342, 87, 458, 202, 385);
    lista.add( curva );
    curva = new Curva( 202, 385, 465, 270, 86, 328, 172, 244);
    lista.add( curva );
    curva = new Curva(172, 244, 266, 160, 2, 242, 3, 165);
    lista.add( curva );
    curva = new Curva(3, 165, 10, 72, 59, 8, 92, 10);
    lista.add( curva );
    curva = new Curva( 92, 10, 127, 3, 148, 156, 201, 8);
    lista.add( curva );
    curva = new Curva( 201, 8, 222, 1, 213, 83, 270, 70);
    lista.add( curva );
    curva = new Curva( 270, 70, 356, 39, 309, 160, 375, 75);
    lista.add( curva );
  }
}

void cruz (float x, float y) {
  line(x-10, y, x+10, y);
  line(x, y-10, x, y+10);
}
