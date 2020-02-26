import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class DetailNewsScreen extends StatefulWidget {
  DetailNewsScreen({
    this.url,this.title
  });
  final String url;
  final String title;
  @override
  _DetailNewsScreenState createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
 
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
    body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        )
 );
  }
}