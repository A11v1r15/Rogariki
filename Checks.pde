boolean CheckVertical(Table test, int i, int j) {
  if (j > 0 && j < 31)
    return test.table[i][j] != Gems.WALL && test.table[i][j] != Gems.DOOR && test.table[i][j] != Gems.VOID
      && test.table[i][j] == test.table[i][j+1] && test.table[i][j] == test.table[i][j-1];
  else return false;
}

boolean CheckHorizontal(Table test, int i, int j) {
  if (j > 0 && j < 31)
    return test.table[i][j] != Gems.WALL && test.table[i][j] != Gems.DOOR && test.table[i][j] != Gems.VOID
      && test.table[i][j] == test.table[i+1][j] && test.table[i][j] == test.table[i-1][j];
  else return false;
}
