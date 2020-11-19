class Resizable { // CLASE PARA CALCULAR LOS VALORES AL MODIFICAR LA VENTANA
  float px, py;

  float valorX (float valor) {
    return map(valor, 0, 800, 0, width);
  }

  float valorY  (float valor) {
    return map(valor, 0, 600, 0, height);
  }

}
