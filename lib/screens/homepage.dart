import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qrcode/screens/scancode.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qr Scanner',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/qrcode.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ScanPage()));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  child: Text('Scan Qr Code'),
                ),
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 17)),
            Padding(
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  child: Text('Generate Qr code'),
                ),
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 17)),
          ],
        ),
      ),
    );
  }
}
