class SubstitutionCipher{
  static String convert(String plainText)
  {
    String cT = "";
    for(int i = 0; i < plainText.length; i++)
    {
      int asci = (32+126) - plainText.codeUnitAt(i);
      cT += String.fromCharCode(asci); 
    }

    return cT;
  }
}