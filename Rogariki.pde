Table table = new Table(o, x, o, x, o);
void setup() {
  size(512, 512);
  setSprites();
  noStroke();
}

void draw() {
  for (int i = 0; i < 32; i++) {
    for (int j = 0; j < 32; j++) {
      image(getSprite(table.table[i][j]), i*16, j*16);
    }
  }
}

PVector lastMouse = new PVector();
void mousePressed() {
  if (mouseButton == LEFT) {
    int i = (mouseX/16);
    int j = (mouseY/16);
    lastMouse.x = i;
    lastMouse.y = j;
    fill(0, 0, 255, 127);
    rect(i*16, j*16, 16, 16);
    if (CheckVertical(table, i, j)) {
      table.table[i][j+1] = Gems.VOID;
      table.table[i][j] = Gems.VOID;
      table.table[i][j-1] = Gems.VOID;
    }
    if (CheckHorizontal(table, i, j)) {
      table.table[i+1][j] = Gems.VOID;
      table.table[i][j] = Gems.VOID;
      table.table[i-1][j] = Gems.VOID;
    }
  } else if (mouseButton == RIGHT) {
    checkAndStop();
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    int i = (mouseX/16);
    int j = (mouseY/16);
    PVector delta = new PVector(lastMouse.x - i, lastMouse.y - j);
    delta.normalize();
    if (abs(delta.x) > abs(delta.y)) {
      delta.y = 0; 
      delta.normalize();
    } else {
      delta.x = 0; 
      delta.normalize();
    }
    Gems temp = table.table[(int)lastMouse.x][(int)lastMouse.y];
    table.table[(int)lastMouse.x][(int)lastMouse.y] = table.table[(int)lastMouse.x - (int)delta.x][(int)lastMouse.y - (int)delta.y];
    table.table[(int)lastMouse.x - (int)delta.x][(int)lastMouse.y - (int)delta.y] = temp;
  }
}

void checkAndStop() {
  fill(255, 0, 0, 127);
  for (int i = 0; i < 32; i++) {
    for (int j = 0; j < 32; j++) {
      if (CheckVertical(table, i, j))
        rect(i*16, (j-1)*16, 16, 48);
    }
  }
  fill(0, 255, 0, 127);
  for (int i = 0; i < 32; i++) {
    for (int j = 0; j < 32; j++) {
      if (CheckHorizontal(table, i, j))
        rect((i-1)*16, j*16, 48, 16);
    }
  }
  noLoop();
}
