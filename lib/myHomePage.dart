import 'package:connection_listener/myListenerPage.dart';
import 'package:flutter/material.dart';

const ITEM_WIFI = 'WiFi';
const ITEM_MOBILE_DATA = 'Mobile Data';
const ITEM_BOTH = 'WiFi and Mobile Data';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _makeButton(String type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            onButtonPressed(context, type);
          },
          child: Text(type),
        ),
      ],
    );
  }

  void onButtonPressed(BuildContext context, String type) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyListenerPage(type),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose listener'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _makeButton(ITEM_WIFI),
          SizedBox(height: 30),
          _makeButton(ITEM_MOBILE_DATA),
          SizedBox(height: 30),
          _makeButton(ITEM_BOTH)
        ],
      ),
    );
  }
}
