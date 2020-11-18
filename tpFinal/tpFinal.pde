AventuraGrafica aventuraGrafica;

import processing.sound.*;
SoundFile salto, click;

void setup() {
  size(800, 600);
  surface.setResizable(true);
  aventuraGrafica = new AventuraGrafica();
  salto= new SoundFile(this, "salto.mp3");
  click = new SoundFile(this, "Click.wav");
}
void draw() {
  aventuraGrafica.dibujar_juego();
}
void mousePressed() {
  aventuraGrafica.cambiarEscena();
  click.play();
}
void keyPressed() {
  aventuraGrafica.miniGame.moverArriba(keyCode);
}
