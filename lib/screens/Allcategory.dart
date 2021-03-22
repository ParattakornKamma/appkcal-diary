import 'package:appgill01/screens/Category1.dart';
import 'package:appgill01/screens/Category2.dart';
import 'package:appgill01/screens/Category3.dart';
import 'package:appgill01/screens/Category4.dart';
import 'package:appgill01/screens/Category5.dart';
import 'package:appgill01/screens/Category6.dart';
import 'package:appgill01/screens/Category7.dart';
import 'package:appgill01/screens/Category8.dart';
import 'package:appgill01/screens/Category9.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Allcategory extends StatefulWidget {
  @override
  _AllcategoryState createState() => _AllcategoryState();
}

class _AllcategoryState extends State<Allcategory> {
  List page = [
    Category1(),
    Category2(),
    Category3(),
    Category4(),
    Category5(),
    Category6(),
    Category7(),
    Category8()
  ];

  CollectionReference getdata =
      FirebaseFirestore.instance.collection('Categories');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getdata.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('ดึงข้อมูลผิด'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Loading"));
        }
        return ListView(
            children:
                snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
          return GestureDetector(
            onTap: () {
              if (documentSnapshot.id == "5e8WJHPeHezqLB4xX9z7") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[0]),
                );
              }

                 if (documentSnapshot.id == "9AKPj4Pi9je1iYkzTvrH") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[1]),
                );
              }

                 if (documentSnapshot.id == "C7w6FLhHGpw5HzFhnvyk") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[2]),
                );
              }

                 if (documentSnapshot.id == "Gb0M8X0KJLvd1ICoVfGL") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[3]),
                );
              }

                 if (documentSnapshot.id == "MDLDNV4V3TkaPu5xyR1E") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[4]),
                );
              }

                 if (documentSnapshot.id == "ZqpxzvoJJp1TYpoeaq4K") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[5]),
                );
              }

                 if (documentSnapshot.id == "eEXx3U9tNAhAXrCtOPR6") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[6]),
                );
              }

                 if (documentSnapshot.id == "nRbVCEF1Bdu1WDVdnO2J") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[7]),
                );
              }

                 if (documentSnapshot.id == "zCzw5IT5Xm9PL11l0kHN") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[8]),
                );
              }
              

              print(documentSnapshot.id);
              print('you click');
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Color(0xff70ADB5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${documentSnapshot.data()['Name']}',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      )
                    ],
                  )),
            ),
          );
        }).toList());
      },
    );
  }
}
