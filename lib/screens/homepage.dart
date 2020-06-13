import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qrcode/screens/generate.dart';
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
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(3),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/qrcode.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                  child: RaisedButton(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.black, width: 0.5)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ScanPage()));
                    },
                    color: Colors.white,
                    textColor: Colors.cyan,
                    child: Text(
                      'Scan Qr Code',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 17)),
              Padding(
                  child: RaisedButton(
                    elevation: 6,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => GenerateScreen()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.cyan,
                    textColor: Colors.white,
                    splashColor: Colors.white,
                    child: Text(
                      'Generate Qr code',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 17)),
            ],
          ),
        ),
      ),
    );
  }
}
