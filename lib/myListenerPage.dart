import 'dart:async';

import 'package:connection_listener/myHomePage.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListenerPage extends StatefulWidget {
  final String type;

  MyListenerPage(this.type);

  @override
  State<StatefulWidget> createState() => _MyListenerPageState(type);
}

class _MyListenerPageState extends State<MyListenerPage> {
  StreamSubscription<ConnectivityResult> subscription;
  final String type;
  ConnectivityResult connectivityResult;

  _MyListenerPageState(this.type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type + ' listener'),
      ),
      body: Scaffold(
        backgroundColor: _getBodyColor(),
      ),
    );
  }

  MaterialColor _getBodyColor() {
    if (connectivityResult == null) {
      return Colors.white;
    }
    switch (type) {
      case ITEM_WIFI:
        return connectivityResult == ConnectivityResult.wifi
            ? Colors.green
            : Colors.red;
      case ITEM_MOBILE_DATA:
        return connectivityResult == ConnectivityResult.mobile
            ? Colors.green
            : Colors.red;
      default:
        return connectivityResult != ConnectivityResult.none
            ? Colors.green
            : Colors.red;
    }
  }

  @override
  void initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        connectivityResult = result;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }
}
