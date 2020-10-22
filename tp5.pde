import processing.sound.*;
SoundFile salto;
MiniGame miniGame;

PImage fondo;
String estado;

void setup() {
  
  size(800, 600);
  miniGame = new MiniGame();
  fondo = loadImage("fondo.png");
  estado="main";
  salto= new SoundFile(this, "salto.mp3");
  
}
void draw() {
  
  image(fondo, 0, 0);
  if (estado=="main") {
    miniGame.mainGame();
  }
  
  if (estado=="juego") {
    miniGame.dibujarJuego();
  }
  
  if (estado=="perder") {
    miniGame.pantallaPerder();
  }
  
  if (estado=="ganar") {
    miniGame.pantallaGanar();
  }
  
}

void keyPressed() {
  miniGame.moverArriba(keyCode);
}
