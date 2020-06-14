import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qrcode/screens/generate.dart';
import 'package:qrcode/screens/saved.dart';
import 'package:qrcode/screens/scancode.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Saved()));
            },
            color: Colors.black,
          )
        ],
        centerTitle: true,
        title: Text(
          'Qr Scanner',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(3),
                child: SizedBox(
                  height: 230,
                  width: 230,
                  child: Image.asset(
                    'assets/1.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ScanPage()));
                  },
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Color(0xFFE84118),
                  child: Text(
                    'Scan Qr Code',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    elevation: 5,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  GeneratePage()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color(0xFF235789),
                    textColor: Colors.white,
                    splashColor: Colors.white,
                    child: Text(
                      'Generate Qr code',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
