import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowAllcatAdmin extends StatefulWidget {
  @override
  _ShowAllcatAdminState createState() => _ShowAllcatAdminState();
}

class _ShowAllcatAdminState extends State<ShowAllcatAdmin> {
  CollectionReference getdata =
      FirebaseFirestore.instance.collection('Categories');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
          stream: getdata.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                onTap: () {print('you click');},
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      color: Color(0xff70ADB5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${documentSnapshot.data()['Name']}',
                          style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white
                  ),)
                        ],
                      )),
                ),
              );
            }).toList());
            //           return ListView.builder(
            // scrollDirection: Axis.vertical,
            // itemCount: snapshot.data.docs.length,
            // itemBuilder: (context, index) {
            //   return ListTile(
            //     title: Text(""),
//     );
//   },
// );
            //   return SingleChildScrollView(
            //   physics: ScrollPhysics(),
            //             child: Container(
            //     child: ListView.builder(
            //       physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: 9,
            //         itemBuilder: (context, index) {
            //           return Padding(
            //             padding: const EdgeInsets.all(1.0),
            //             child: Container(
            //               height: 39,
            //               color: Color(0xff70ADB5),
            //               child: Center(
            //                   child:
            //                   Text('${snapshot.data.docs.map((e) => e.data()['Name'])}')),
            //             ),
            //           );
            //         }),
            //   ),
            // );
            // return Text('${snapshot.data.docs.map((e) => e.data()['Name']).last}');
          },
        );
  }
}