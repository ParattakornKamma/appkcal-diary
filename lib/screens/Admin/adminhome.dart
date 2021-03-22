import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appgill01/screens/Category1.dart';
import 'package:appgill01/screens/Admin/LauncherAd.dart';
import 'package:appgill01/screens/Setting.dart';
import 'package:appgill01/screens/Admin/ShowAllcatAdmin.dart';
import 'package:appgill01/screens/showusers.dart';

class adminhome extends StatefulWidget {
  @override
  _adminhomeState createState() => _adminhomeState();
}
class _adminhomeState extends State<adminhome> {
  int _selectedPage = 0;
  final _page0ptions = [
    LauncherAd(),
    Showusers(),
    ShowAllcatAdmin(),
    Setting1(),
  
  ];
  // CollectionReference getdata =
  //     FirebaseFirestore.instance.collection('Category1');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff132743),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          toolbarHeight: 140,
          title: Text('AdminHome'),
          centerTitle: true,
        ),
       body: _page0ptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPage,
          backgroundColor: Color(0xff70ADB5),
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedPage == 0 ? Color(0xff132743) : Colors.white,
              ),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                color: _selectedPage == 1 ? Color(0xff132743) : Colors.white,
              ),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.storage,
                color: _selectedPage == 2 ? Color(0xff132743) : Colors.white,
              ),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _selectedPage == 3 ? Color(0xff132743) : Colors.white,
              ),
              title: Container(),
            ),
          ],
        ),
    );
  }
}
