import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class LogoutScreen extends StatefulWidget {
  @override
  _LogoutScreenState createState() => new _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  TextEditingController _numberCtrl = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "0932634381";
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('ติดต่อ'),
        ),
        body: new Column(),
      ),
    );
  }
}