class Fondos {
  PImage[] fondos = new PImage [11];
  float py, px;


  Fondos () {
    px=195;
    py=700;
    for (int i =0; i<11; i++) {
      fondos[i]= loadImage( i + ".png");
    }
  }
  void image_resizable(float px1, float py1) {
    px=px1;
    py=py1;
  }
  void escena_inicio() {
    image(fondos[0], 0, 0, px, py);
  }

  void escena_basurero() {
    image(fondos[1], 0, 0, px, py);
  }

  void escena_hacerruido() {
    image(fondos[2], 0, 0, px, py);
  }

  void escena_humanodespierta() {
    image(fondos[3], 0, 0, px, py);
  }

  void escena_humanoignora() {
    image(fondos[4], 0, 0, px, py);
  }

  void escena_puertacerrada() {
    image(fondos[5], 0, 0, px, py);
  }

  void escena_finaltriste() {
    image(fondos[6], 0, 0, px, py);
  }

  void escena_finalfeliz() {
    image(fondos[7], 0, 0, px, py);
  }

  void escena_finalfelizbasurero() {
    image(fondos[8], 0, 0, px, py);
  }

  void escena_quehacer() {
    image(fondos[9], 0, 0, px, py);
  }

  void escena_salirbuscarcomida() {
    image(fondos[10], 0, 0, px, py);
  }

  void escena_creditos() {
    background(0);
    fill(255);
    textSize(40);
    text("Alumna: Landivar, Melina \n Legajo: 85080/1 \n Comisión: 1 \n Tecnología Multimedial I \n Facultad de Artes", px, py);
    py--;
  }
}
