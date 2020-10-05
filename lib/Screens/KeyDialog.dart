import 'package:bmi_app/Screens/DecryptRoute.dart';
import 'package:bmi_app/Screens/EncryptRoute.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class EncryptKeyDialog extends StatelessWidget {
  int type;
  EncryptState screen;
  EncryptKeyDialog(this.type, this.screen);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 16,
      child: Container(
        height: 250,
        width: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  "Enter Key",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 64, right: 64),
              child: TextField(
                  controller: MyApp.keyController,
                  style: TextStyle(fontSize: 24),
                  keyboardType: (MyApp.selectedCipher == MyApp.cipherTypes[0] ||
                          MyApp.selectedCipher == MyApp.cipherTypes[4])
                      ? TextInputType.numberWithOptions(
                          signed: true, decimal: false)
                      : TextInputType.text),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Center(
                child: RaisedButton(
                  child: Text(
                    "OK",
                    style: TextStyle(fontSize: 24),
                  ),
                  textColor: Colors.white,
                  color: Colors.indigoAccent,
                  disabledColor: Colors.indigoAccent,
                  disabledTextColor: Colors.white,
                  onPressed: () {
                    screen.updateKey((MyApp.keyController.text));
                    screen.convertToCipher();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DecryptKeyDialog extends StatelessWidget {
  int type;
  DecryptRouteState screen;
  DecryptKeyDialog(this.type, this.screen);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 16,
      child: Container(
        height: 250,
        width: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  "Cipher Options",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 64, right: 64),
              child: TextField(
                  controller: MyApp.keyController,
                  style: TextStyle(fontSize: 24),
                  keyboardType: (MyApp.selectedCipher == MyApp.cipherTypes[0])
                      ? TextInputType.numberWithOptions(
                          signed: true, decimal: false)
                      : TextInputType.text),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Center(
                child: RaisedButton(
                  child: Text(
                    "OK",
                    style: TextStyle(fontSize: 24),
                  ),
                  textColor: Colors.white,
                  color: Colors.indigoAccent,
                  disabledColor: Colors.indigoAccent,
                  disabledTextColor: Colors.white,
                  onPressed: () {
                    screen.updateKey((MyApp.keyController.text));
                    screen.convertToPlain();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
