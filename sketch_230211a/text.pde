
void drawText(String text) {
  textFont(textFont);
  fill(102, 205, 66);
  currentString = "";
  text = text + " ";
  String[] texts = text.split(" ");
  ArrayList<String> lines = new ArrayList <String>();
  for (int i = 0; i < texts.length; i++) {
    currentString += " " + texts[i];
    if (textWidth(currentString) > 600) {
      lines.add(currentString);
      currentString = texts[i];
    }
    if (i == texts.length -1 ) {
      lines.add(currentString);
    }
  }
  for (int i = 0; i < lines.size(); i++) {

    text(lines.get(i), width/2-275, 530 + 30 * i);
  }
}
