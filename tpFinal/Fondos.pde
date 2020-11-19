class Fondos {
  PImage[] fondos = new PImage [11];
  float py, px, px1, py1;
  Resizable r;


  Fondos () {
    px1=195;
    py1=700;
    r = new Resizable();
    px=800;
    py=600;

    for (int i =0; i<11; i++) {
      fondos[i]= loadImage( i + ".png");
    }
  }

  void escena_inicio() {
    image(fondos[0], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_basurero() {
    image(fondos[1], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_hacerruido() {
    image(fondos[2], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_humanodespierta() {
    image(fondos[3], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_humanoignora() {
    image(fondos[4], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_puertacerrada() {
    image(fondos[5], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_finaltriste() {
    image(fondos[6], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_finalfeliz() {
    image(fondos[7], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_finalfelizbasurero() {
    image(fondos[8], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_quehacer() {
    image(fondos[9], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_salirbuscarcomida() {
    image(fondos[10], 0, 0, r.valorX(px), r.valorY(py));
  }

  void escena_creditos() {
    background(0);
    fill(255);
    textSize(40);
    text("Alumna: Landivar, Melina \n Legajo: 85080/1 \n Comisión: 1 \n Tecnología Multimedial I \n Facultad de Artes", r.valorX(px1), r.valorY(py1));
    fill(255,0,0);
    text("VOLVER A JUGAR", r.valorX(px1), r.valorY(py1)+r.valorY(350));
    if (py1>r.valorY(200)){
      py1--;
  }
  }
}
