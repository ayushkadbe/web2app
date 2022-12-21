import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppBrowserPage extends StatefulWidget{
  const InAppBrowserPage({Key? key}): super(key: key);

  @override
  _InAppBrowserPageState createState() => _InAppBrowserPageState();
}

class _InAppBrowserPageState extends State<InAppBrowserPage>{
  //progress
  double _progress = 0;
  late InAppWebViewController webView;

  //Globalkey
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Youtube",
            style: TextStyle(color: Colors.black)
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://www.youtube.com/")
            ),
            onWebViewCreated: (InAppWebViewController controller){
              webView = controller;
            },
            onProgressChanged: (InAppWebViewController controller, int progress){
              setState(() {
                _progress= progress/ 100;
              });
            },
          ),
          _progress <1 ? SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            ),
          ): const SizedBox(),
        ],
      ),
    );
  }
}