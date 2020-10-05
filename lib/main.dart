import 'package:bmi_app/Ciphers/PlayfairCipher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/DecryptRoute.dart';
import 'Screens/EncryptRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static String cipherText = "Cipher Text";
  static String cipherKey = "1";
  static final List<String> cipherTypes = [
    "Shift Cipher",
    "Vigenere Cipher",
    "Playfair Cipher",
    "Substitution Cipher",
    "Railfence Cipher"
  ];
  static String selectedCipher = "Shift Cipher";
  static final keyController = TextEditingController();
  static final myController = TextEditingController();
  static String plainText = "Plain Text";

  @override
  Widget build(BuildContext context) {
    PlayfairCipher.decrypt("ABCDEFGX", "Question", "J");
    return MaterialApp(
        title: 'Cryptography',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Cryptography'),
              backgroundColor: Colors.black,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "ENCRYPTION",
                  ),
                  Tab(
                    text: "DECRYPTION",
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[EncryptRoute(), DecryptRoute()],
            ),
          ),
        ));
  }
}
