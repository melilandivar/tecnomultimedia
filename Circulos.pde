class Circulo {


  //atributos

  float x, y;
  float b1, b2, b3, b4, ang;
  float b1_, b2_, b3_, b4_;
  float diametro;
  float c1=100,c2=300;
  float p0=50,p1=25,p2=250,p3=200;

  color trazado; 

  //constructor

  Circulo() {

 
  }



  //funcionalidades o métodos

  void dibujar () {
    pushStyle();

    //LADO IZQUIERDO.------------------
    beginShape();
    noFill();
    vertex(220, 10); //P1
    bezierVertex(p0, p1,p2, p3, 100,200);
    bezierVertex(p0+p0/5, p3+p0/2, p3+p0/3, p3+p1-p1/10, 25, 300);
    bezierVertex(0, p3+p1, 0, p3+p1+p2,200, 350);
    bezierVertex(p3+p0, p3+p2, p0+p0/2, p3*2, 100, 400);
    bezierVertex(p1+p0/2, p3*2+p2, p0+p0/2, p3*2+p2, 150,580);
    endShape();
    //LINEA ABAJO------------------
    stroke(10);
    line(150,580, 350,580);
    //LADO DERECHO---------
    beginShape();
    noFill();
    vertex(350, 580); //CONTINUA DONDE DEJO LA LINEA RECTA
    bezierVertex(p3+p1-p0/2, p3*3-p0/2, p3+p1+p2, p3+p2+p0/2, 250, 350);
    bezierVertex(p3+p0, p3+p2, p3+p0/2, p2, 300, 100);
    bezierVertex(p3*2, p2, p3+p2, p0/5, 350, 10);
    bezierVertex(p1+p0/2, 0, p3+p2-p0/2, p0/10, 220,10);
    endShape();
  }


  void agrandar () {
    
        p0=random(10,100);
        p1=random(5,70);
        p2=random(50,400);
        p3=random(50,400);
    
  }



  boolean mouseAdentro (float mx, float my) {

    return dist (mx, my, x, y) <= diametro;
  } 

}
