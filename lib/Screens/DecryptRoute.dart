import 'package:bmi_app/Ciphers/PlayfairCipher.dart';
import 'package:bmi_app/Ciphers/RailFenceCipher.dart';
import 'package:bmi_app/Ciphers/ShiftCipher.dart';
import 'package:bmi_app/Ciphers/SubstitutionCipher.dart';
import 'package:bmi_app/Ciphers/VigenereCipher.dart';
import 'package:bmi_app/Screens/KeyDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class DecryptRoute extends StatefulWidget {
  @override
  DecryptRouteState createState() => DecryptRouteState();
}

class DecryptRouteState extends State<DecryptRoute> {
  DecryptRouteState() {
    MyApp.myController.text = MyApp.cipherText;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.indigo, Colors.indigoAccent]),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          "lib/assets/images/CryptoBG.jpg",
                          height: double.maxFinite,
                          width: double.maxFinite,
                          fit: BoxFit.fitWidth,
                          color: Colors.indigo,
                          colorBlendMode: BlendMode.screen,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 32, right: 16, left: 16),
                              child: Center(
                                child: TextFormField(
                                  cursorColor: Colors.white,
                                  enableInteractiveSelection: true,
                                  maxLines: null,
                                  controller: MyApp.myController,
                                  decoration: InputDecoration(
                                      hintText: "Cipher Text",
                                      hintStyle: TextStyle(color: Colors.white),
                                      focusColor: Colors.white,
                                      border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 100),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      MyApp.plainText,
                      maxLines: null,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 64),
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            child: Card(
                color: Colors.white,
                elevation: 3.0,
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        DropdownButton<String>(
                          value: MyApp.selectedCipher,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          onChanged: (value) {
                            setState(() {
                              MyApp.selectedCipher = value.toString();
                            });
                          },
                          items: MyApp.cipherTypes.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                          underline: Container(
                            height: 1.6,
                            color: Colors.indigoAccent,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: null,
                              width: null,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.fromBorderSide(
                                      BorderSide(color: Colors.indigoAccent))),
                              child: IconButton(
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.indigoAccent,
                                ),
                                color: Colors.indigoAccent,
                                iconSize: 32,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return DecryptKeyDialog(0, this);
                                      });
                                },
                              ),
                            ),
                            Text(
                              ": " + MyApp.cipherKey.toString(),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.indigoAccent),
                            )
                          ],
                        )
                      ],
                    ))),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(32),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.extended(
              label: Text('Convert'),
              icon: Icon(Icons.swap_vert),
              onPressed: () {
                convertToPlain();
              },
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    MyApp.myController.text = MyApp.plainText;
  }

  void convertToPlain() {
    setState(() {
      if (MyApp.selectedCipher == MyApp.cipherTypes[0])
        MyApp.plainText = ShiftCipher.decrypt(
            MyApp.myController.text, int.parse(MyApp.cipherKey));
      else if (MyApp.selectedCipher == MyApp.cipherTypes[1])
        MyApp.plainText =
            VigenereCipher.decrypt(MyApp.myController.text, MyApp.cipherKey);
      else if (MyApp.selectedCipher == MyApp.cipherTypes[2])
        MyApp.plainText = PlayfairCipher.decrypt(
            MyApp.myController.text, MyApp.cipherKey, "X");
      else if ((MyApp.selectedCipher == MyApp.cipherTypes[3]))
        MyApp.plainText = SubstitutionCipher.convert(MyApp.myController.text);
      else
        MyApp.plainText = RailFenceCipher.decrypt(
            MyApp.myController.text, int.parse(MyApp.cipherKey) - 1);
    });
  }

  void updateKey(String k) {
    setState(() {
      MyApp.cipherKey = k;
    });
  }
}
