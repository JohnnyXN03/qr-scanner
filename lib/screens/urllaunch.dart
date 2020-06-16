import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(Web(null));

class Web extends StatefulWidget {
  final String urlnew;
  Web(this.urlnew);

  @override
  _WebState createState() => _WebState();
}

class _WebState extends State<Web> {
  bool isContainHttp = false;
  @override
  void initState() {
    if (widget.urlnew.contains('http') ||
        widget.urlnew.contains('https') ||
        widget.urlnew.contains('www') ||
        widget.urlnew.contains('WWW'))
      setState(() {
        isContainHttp = true;
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isContainHttp)
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Browse url'),
        ),
        body: WebviewScaffold(url: widget.urlnew) == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WebviewScaffold(url: widget.urlnew),
              ),
      ));
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('this code do not have any url.'),
            ),
            Container(
              child: Text(widget.urlnew),
            )
          ],
        ),
      ),
    );
  }
}
