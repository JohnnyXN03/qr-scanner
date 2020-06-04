import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Web extends StatelessWidget {
  final String urlnew;
  Web(this.urlnew);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Browse url'),
      ),
      body: WebviewScaffold(url: urlnew) == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebviewScaffold(url: urlnew),
            ),
    ));
  }
}
