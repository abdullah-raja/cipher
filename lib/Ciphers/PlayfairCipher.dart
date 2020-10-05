class PlayfairCipher{
  static List<List> createMatrix(String key, String remove){
    List<List> matrix = List<List>.generate(5, (_) => new List<String>(5));
    int row = 0;
    int col = 0;

    key = key.toUpperCase();
    for(int i = 0; i < key.length; i++)
      {

        if(findInMatrix(key[i], matrix) < 0 && key[i] != "J")
          {
            matrix[row][col] = key[i];
            col++;
            if(col > 4)
              {
                row++;
                col = 0;
              }
          }
      }

    for(int i = 65; i <= 90; i++)
      {
        String ch = String.fromCharCode(i);
        if(findInMatrix(ch, matrix) < 0 && ch != "J")
        {
          matrix[row][col] = ch;
          col++;
          if(col > 4)
          {
            row++;
            col = 0;
          }
        }
      }

    print(matrix);
    return matrix;

  }

  static String convertPlainText(String plainText, String remove, String sub)
  {
    String updatedPT = "";
    plainText = plainText.replaceAll(' ', '').toUpperCase();
    plainText = plainText.replaceAll('J', 'I');

    for(int i = 0; i < plainText.length; i+=2)
      {
        try {
          if(plainText[i] != plainText[i+1])
          {
            updatedPT += plainText[i] + plainText[i+1];
          }

          else
          {
            updatedPT += plainText[i] + sub;
            i--;
          }


        }

        catch(e){
          updatedPT += plainText[i];
        }
      }

    if(updatedPT.length % 2 != 0)
      updatedPT += sub;

    print(updatedPT);
    return updatedPT;
  }

  static int findInMatrix(String ch, List<List> matrix){
    int index = -1;

    for(int i = 0; i < matrix.length; i++){
      for(int j = 0; j < matrix[i].length; j++)
        {
          if(ch == matrix[i][j])
            {
              index = (i*10) + j; // get j by % 10 nd row by / 10
              break;
            }
        }
    }

    return index;

  }

  static String encrypt(String plainText, String key, String remove, String sub)
  {
    List<List> matrix = createMatrix(key, remove);
    String updatedPT = convertPlainText(plainText, remove, sub);
    String cipherText = "";

    for(int i = 0; i < updatedPT.length; i += 2)
      {
        int p1 = findInMatrix(updatedPT[i], matrix);
        int r1 = p1 ~/ 10;
        int c1 = p1 % 10;

        int p2 = findInMatrix(updatedPT[i+1], matrix);
        int r2 = p2 ~/ 10;
        int c2 = p2 % 10;

        if(c1 == c2) // same col
          {
            cipherText += matrix[(r1 + 1) % 5][c1];
            cipherText += matrix[(r2 + 1) % 5][c2];
          }

        else if(r1 == r2)
          {
            cipherText += matrix[r1][(c1 + 1) % 5];
            cipherText += matrix[r2][(c2 + 1) % 5];
          }

        else
          {
            cipherText += matrix[r1][c2];
            cipherText += matrix[r2][c1];
          }

      }

    print(cipherText);
    return cipherText;
  }

  static String decrypt(String cipherText, String key, String remove)
  {
    List<List> matrix = createMatrix(key, remove);

    String plainText = "";

    for(int i = 0; i < cipherText.length; i += 2)
      {
        int p1 = findInMatrix(cipherText[i], matrix);
        int r1 = p1 ~/ 10;
        int c1 = p1 % 10;

        int p2 = findInMatrix(cipherText[i+1], matrix);
        int r2 = p2 ~/ 10;
        int c2 = p2 % 10;

        if(c1 == c2) // same col
          {
            plainText += matrix[(r1 - 1) % 5][c1];
            plainText += matrix[(r2 - 1) % 5][c2];
          }

        else if(r1 == r2)
          {
            plainText += matrix[r1][(c1 - 1) % 5];
            plainText += matrix[r2][(c2 - 1) % 5];
          }

        else
          {
            plainText += matrix[r1][c2];
            plainText += matrix[r2][c1];
          }

      }

    print(plainText);
    return plainText;

  }
}