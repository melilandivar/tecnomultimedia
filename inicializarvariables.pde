void inicializarvariables(){

for (int i=0;i<11;i++){
    imagenes[i]= loadImage( i + ".png");
    println( i + ".png");
}
fuente= createFont("Rockwell-48.vlw",60);
basura=false;
ignora=false;
ruido=false;
despierta=false;
puerta=false;
estado = "inicio";
feliz=false;
triste=false;
salir=false;
px=195;
py=700;
}
