import 'package:flutter/material.dart';

import 'in_app_browser_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Inapp browser'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InAppBrowserPage()),
            );
          },
          child: Center(
            child: Text("Open Website"),
          ),
        ),
      ),
    );
  }
}