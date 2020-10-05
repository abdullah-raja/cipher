class ShiftCipher {
  static String encrypt(String plainText, int key)
  {
    String cipherText = "";

    for(int i = 0; i < plainText.length; i++)
      {
        int asciCode = plainText.codeUnitAt(i)+key;

        int mod = (asciCode-32) % 95;
        if (mod < 0)
          mod += 95;

        print(32+mod);
        cipherText += String.fromCharCode(32+mod);

      }


    return cipherText;


  }


  static String decrypt(String cipherText, int key)
  {
    String plainText = "";

    for(int i = 0; i < cipherText.length; i++)
    {
      int asciCode = cipherText.codeUnitAt(i)-key;

      int mod = (asciCode-32) % 95;
      if (mod < 0)
        mod += 95;

      print(32+mod);
      plainText += String.fromCharCode(32+mod);

    }


    return plainText;


  }
}