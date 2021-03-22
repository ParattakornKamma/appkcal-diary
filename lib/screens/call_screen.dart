import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  TextEditingController _numberCtrl = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "0932634381";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff132743),
          title: const Text('ติดต่อ'),
        ),
        body: Column(
          children:<Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _numberCtrl,
                decoration: InputDecoration(
                  labelText: "เบอร์มือถือ"
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text("โทรออก"),
              onPressed: () async{
                FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
              },
            )
          ]
        ),
      );
    
  }
}