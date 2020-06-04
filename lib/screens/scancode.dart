import 'package:flutter/material.dart';
import 'package:qrcode/screens/urllaunch.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'dart:async';
import 'dart:typed_data';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrcode = "";
  Uint8List bytes = Uint8List(200);

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Scan QR'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  qrcode,
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text('Tap below to browse link'),
                ),
                SizedBox(
                  height: 25,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: RaisedButton(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.cyan,
                    onPressed: () {
                      var url = qrcode;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Web(url)));
                    },
                    child: Text(
                      'browse',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scan,
        label: Text('Scan'),
        backgroundColor: Colors.red,
        isExtended: true,
        icon: Icon(Icons.camera),
      ),
    ));
  }

  Future _scan() async {
    String qrcode = await scanner.scan();
    setState(() {
      this.qrcode = qrcode;
    });
  }
}
