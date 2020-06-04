import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = '';
  Future<String> _scanQR() async {
    try {
      String barcode = await BarcodeScanner.scan().toString();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = "Camera permission was denied";
        });
      } else {
        setState(() => this.barcode = "Unknown Error $ex");
      }
    } on FormatException {
      setState(() => this.barcode =
          "You pressed the back button before scanning anything");
    } catch (ex) {
      setState(() => this.barcode = "Unknown Error $ex");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('QR Code Scanner'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: _scanQR,
                    child: const Text('START CAMERA SCAN')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  barcode,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
