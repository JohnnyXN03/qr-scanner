import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:qrcode/screens/saved.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  TextEditingController qrdataFeed = TextEditingController();
  String qrData = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Saved()));
              },
              color: Colors.white,
            )
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            'QR Generator',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 21,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QrImage(
                  padding: EdgeInsets.all(80),
                  data: qrData,
                  version: QrVersions.auto,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Generate Qr code",
                      style: TextStyle(fontSize: 17, fontFamily: 'OpenSans'),
                    ),
                    Container(
                      child: TextField(
                        controller: qrdataFeed,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Input your link",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {},
                              child: Text(
                                "Share",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold),
                              ),
                              elevation: 2,
                              color: Color(0xFF235789)),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () async {
                                if (qrdataFeed.text.isEmpty) {
                                  setState(() {
                                    qrData = "";
                                  });
                                } else {
                                  setState(() {
                                    qrData = qrdataFeed.text;
                                  });
                                }
                              },
                              child: Text(
                                "Generate and save",
                                style: TextStyle(
                                    fontFamily: 'openSans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              elevation: 2,
                              color: Color(0xFFE84118)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
