void humanodespierta() {
  if (estado=="humanodespierta" && despierta==true) {
    if (mouseX >= 104 && mouseX <=289 && mouseY>=471 && mouseY <=575) {
      estado="finalfeliz";
    }
    if (mouseX > 508 && mouseX < 693 &&mouseY>=471 && mouseY <=575) {
      estado="finaltriste";
    }
  }
}
