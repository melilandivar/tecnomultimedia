void setup() {
  size(500, 600);
}
void draw () {
  background(255);
  bezier(143, 72, 222, -10, 246, 39, 294, 30);

}
void mousePressed() {
  println("X: " + mouseX);
  println("Y: "  + mouseY);
}
