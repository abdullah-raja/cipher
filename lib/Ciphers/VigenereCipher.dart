class VigenereCipher {

  static String encrypt(String plainText, String key){

    String cipherText = "";

    for(int i = 0; i < plainText.length; i++)
    {
      int keyAsciCode = key.codeUnitAt(i % (key.length));
      int asciCode = plainText.codeUnitAt(i)+keyAsciCode;

      int mod = (asciCode-32) % 95;
      if (mod < 0)
        mod += 95;
      print(mod + 32);

      cipherText += String.fromCharCode(mod+32);

    }


    return cipherText;

  }

  static String decrypt(String cipherText, String key){

    String plainText = "";

    for(int i = 0; i < cipherText.length; i++)
    {
      int keyAsciCode = key.codeUnitAt(i % (key.length));
      int asciCode = cipherText.codeUnitAt(i)-keyAsciCode;

      int mod = (asciCode-32) % 95;
      if (mod < 0)
        mod += 95;
      print(mod + 32);

      plainText += String.fromCharCode(mod+32);

    }


    return plainText;

  }


}