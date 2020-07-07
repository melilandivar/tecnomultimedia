void inicializarvariables(){
inicio=loadImage("inicio.png");
basurero = loadImage("basurero.png");
finalfeliz=loadImage("finalfeliz.png");
finaltriste=loadImage("finaltriste.png");
finalfelizbasurero=loadImage("finalfelizbasurero.png");
hacerruido=loadImage("hacerruido.png");
humanodespierta=loadImage("humanodespierta.png");
humanoignora=loadImage("humanoignora.png");
puertacerrada=loadImage("puertacerrada.png");
quehacer1=loadImage("quehacer1.png");
salirabuscarcomida=loadImage("salirabuscarcomida.png");

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
