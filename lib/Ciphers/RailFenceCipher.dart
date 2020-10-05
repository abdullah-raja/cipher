class RailFenceCipher {
  static String encrypt(String value, int key) {
    String cipherText = "";
    List<List> railfence =
        List<List>.generate(key + 1, (_) => new List<String>(value.length));
    int rowPointer = 0;
    int dir = -1;

    for (int i = 0; i < value.length; i++) {
      // LOOP for string
      if (rowPointer == key) dir = -1;
      if (rowPointer == 0) dir = 1;

      railfence[rowPointer][i] = value[i];
      rowPointer = rowPointer + dir;
    }

    // railfence crreated

    for (int r = 0; r <= key; r++) {
      for (int c = 0; c < value.length; c++) {
        if (railfence[r][c] != null) cipherText += railfence[r][c];
      }
    }
    return cipherText;
  }

  static String decrypt(String value, int key) {
    String plainText = "";
    List<List> railfence =
        List<List>.generate(key + 1, (_) => new List<String>(value.length));
    int rowPointer = 0;
    int colPointer = 0;
    int row_num = 0;
    int gap = 0;

    for (int i = 0; i < value.length; i++) {
      railfence[rowPointer][colPointer] = value[i];
      row_num = key - rowPointer;
      gap = row_num + (row_num - 1);
      if (row_num == 0) gap = key + 1;
      colPointer = colPointer + gap + 1;

      if (colPointer >= value.length) {
        rowPointer++;
        colPointer = rowPointer;
      }
    }

    rowPointer = 0;
    int dir = 1;

    for (int i = 0; i < value.length; i++) {
      // LOOP for string
      if (rowPointer == key) dir = -1;
      if (rowPointer == 0) dir = 1;

      plainText += railfence[rowPointer][i];
      rowPointer = rowPointer + dir;
    }

    return plainText;
  }
}
