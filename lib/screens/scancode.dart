import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode/screens/saved.dart';
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
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.history),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Saved()));
                    },
                    color: Colors.white),
              ],
              title: Text(
                'Scan QR',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.black,
              elevation: 0,
            ),
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          qrcode,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Tap below to browse link',
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'OpenSans'),
                        ),
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
                              borderRadius: BorderRadius.circular(10)),
                          color: Color(0xFF235789),
                          onPressed: () {
                            var url = qrcode;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Web(url)));
                          },
                          child: Text(
                            'browse',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: RaisedButton(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color(0xFF235789),
                          onPressed: () {},
                          child: Text(
                            'Save',
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
              backgroundColor: Color(0xFFE84118),
              isExtended: true,
              icon: Icon(Icons.camera),
            )));
  }

  Future _scan() async {
    String qrcode = await scanner.scan();
    setState(() {
      this.qrcode = qrcode;
    });
  }
}
