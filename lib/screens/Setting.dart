import 'package:appgill01/screens/call_screen.dart';
import 'package:flutter/material.dart';
import 'package:appgill01/screens/Category1.dart';
import 'package:appgill01/screens/login_screen.dart';

class Setting1 extends StatefulWidget {
  @override
  _Setting1State createState() => _Setting1State();
}

class _Setting1State extends State<Setting1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: Card(
                    color: Colors.grey[200],
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CallScreen()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("ติดต่อเรา"),
                        ),
                      ),
                    )),
              )),
          Container(
            height: 50,
            width: double.infinity,
            child: Card(
                color: Colors.grey[200],
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("ออกจากระบบ"),
                    ),
                  ),
                )
                ),
          ),

          // Container(
          //   width: 353,
          //   child: RaisedButton(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(3.0),
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => LoginScreen(),
          //         ),
          //       );
          //     },
          //     color: Colors.red[800],
          //     child: Text(
          //       'ออกจากระบบ',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
