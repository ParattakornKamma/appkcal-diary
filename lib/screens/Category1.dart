// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Category1 extends StatefulWidget {
  @override
  _Category1State createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  CollectionReference getdata =
      FirebaseFirestore.instance.collection('Category1');
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
          title: Text('อาหารจานเดียว'),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: getdata.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('ดึงข้อมูลผิด'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return ListView(
                children:
                    snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
              return GestureDetector(
                onTap: () {
                  print('you click');
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      color: Color(0xff70ADB5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${documentSnapshot.data()['Name']}',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          Text(
                            '${documentSnapshot.data()['Kcal']} Kcal',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          )
                        ],
                      )),
                ),
              );
            }).toList());
          },
        ));
  }
}
