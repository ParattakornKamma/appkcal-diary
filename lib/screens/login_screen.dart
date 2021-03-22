import 'dart:ffi';
// import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appgill01/screens/Homepage.dart';
import 'package:appgill01/screens/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'signup_screen.dart';
import 'home_screen.dart';
import '../mode/authentication.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShowing = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {'email': '', 'password': ''};

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('พบข้อผิดพลาด'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  child: Text('ตกลง'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .logIn(_authData['email'], _authData['password']);
      Navigator.of(context).pushReplacementNamed(Homepage.routeName);
    } catch (error) {
      var errorMessage = 'กรุณาตรวจสอบใหม่อีกครั้ง';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.red,
          title: Text('Login'),
          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[Text('สมัคร'), Icon(Icons.person_add)],
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignupScreen.routeName);
              },
            )
          ],
        ),
        body: new Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/foodbb.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment(0.1, -0.8),
                      child: Text(
                        'Kcal Diary',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey),
                  )
                ],
              ),
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 260,
                  width: 300,
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          //email
                          TextFormField(
                            decoration: InputDecoration(labelText: 'อีเมล'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'อีเมลไม่ถูกต้อง';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                          ),

                          //password
                          TextFormField(
                            decoration: InputDecoration(labelText: 'พาสเวิร์ด'),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty || value.length <= 5) {
                                return 'พาสเวิร์ดไม่ถูกต้อง';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RaisedButton(
                            child: Text('เข้าสู่ระบบ'),
                            onPressed: () {
                              _submit();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.blue[800],
                            textColor: Colors.white,
                          ),
                          isShowing == true
                              ? CircularProgressIndicator()
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}