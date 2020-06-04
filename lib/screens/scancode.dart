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
        backgroundColor: Colors.black,
      ),
      body: Center(
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
              height: 50,
              width: 50,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  var url = qrcode;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Web(qrcode)));
                },
                child: Text('browse'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scan,
        label: Text('Scan'),
        backgroundColor: Colors.pink,
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
