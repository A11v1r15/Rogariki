final static boolean o = true;
final static boolean x = false;

class Table {
  Gems[][] table = new Gems[32][32];
  boolean nExit;
  boolean sExit;
  boolean eExit;
  boolean wExit;
  boolean cExit;

  Table(boolean n, boolean s, boolean e, boolean w, boolean c) {
    nExit = n;
    sExit = s;
    eExit = e;
    wExit = w;
    cExit = c;
    for (int i = 0; i < 32; i++) {
      for (int j = 0; j < 32; j++) {
        table[i][j] = Gems.WALL;
      }
    }
    for (int i = 1; i < 31; i++) {
      for (int j = 1; j < 31; j++) {
        table[i][j] = RandomGem();
      }
    }
    for (int i = 1; i < 31; i++) {
      for (int j = 1; j < 31; j++) {
          if (CheckVertical(this, i, j) || CheckHorizontal(this, i, j))
            table[i][j] = RandomGem(table[i][j]);
      }
    }
    if (nExit) table[14][0] = table[15][0] = table[16][0] = table[17][0] = Gems.DOOR;
    if (sExit) table[14][31] = table[15][31] = table[16][31] = table[17][31] = Gems.DOOR;
    if (eExit) table[0][14] = table[0][15] = table[0][16] = table[0][17] = Gems.DOOR;
    if (wExit) table[31][14] = table[31][15] = table[31][16] = table[31][17] = Gems.DOOR;
    if (cExit) table[15][15] = table[16][16] = table[15][16] = table[16][15] = Gems.DOOR;
  }
}

Gems RandomGem() {
  int test = (int)random(4);
  switch(test) {
  case 0:
    return Gems.ATOM;
  case 1:
    return Gems.BAT;
  case 2:
    return Gems.CANDY;
  case 3:
    return Gems.HEAL;
  default:
    return Gems.VOID;
  }
}

Gems RandomGem(Gems different) {
  Gems testGem = RandomGem();
  while (different == testGem) {  
    testGem = RandomGem();
  }
  return testGem;
}
