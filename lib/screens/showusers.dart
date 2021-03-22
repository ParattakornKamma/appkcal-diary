import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Showusers extends StatelessWidget {
  // final myController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffolkey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final kcalController = TextEditingController();
  // final String Name;
  // final int Kcal;
  // final String Type;
  String name;
  int kcal;
  String type;
  // Showusers(this.Name, this.Kcal, this.Type);



  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference category9 =
        FirebaseFirestore.instance.collection('Category9');

    Future<void> addFood() {

      print("xxxxxxxxxxxxxxxx1");
      // Call the user's CollectionReference to add a new user
      return category9
          .add({
            'Name': name, // John Doe
            'Kcal': kcal, // Stokes and Sons
            'Type': type,
          })
          .then((value) => print("สำเร็จ"))
          .catchError((error) => print("Failed to add user: $error"));

         
    }

    // return Scaffold(
    //   body: Center(
    //     child: TextFormField(
    //       decoration: InputDecoration(labelText: 'ชื่อประเภท'),
    //       validator: (String value) =>
    //       addFood: (value) => type = value,
    //     ),
    //     child: FlatButton(
    //       onPressed: addFood,
    //       child: Text(
    //         "เพิ่ม",
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      key: _scaffolkey,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: typeController,
              decoration: InputDecoration(labelText: 'ชื่อประเภท'),
              keyboardType: TextInputType.text,
              // validator: (String value) =>
              //     value.isEmpty ? 'ใส่ชื่อประเภทด้วยนะ' : null,
              onSaved: (value) => type = value,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'ชื่ออาหาร'),
              keyboardType: TextInputType.text,
              // validator: (String value) => value.isEmpty ? 'ใส่ชื่ออาหารด้วยสิ' : null,
              onSaved: (value) => name = value,
            ),
            TextFormField(
              controller: kcalController,
              decoration: InputDecoration(labelText: 'Kcal'),
              keyboardType: TextInputType.number,
              // validator: (String value) => value.isEmpty ? 'ใส่จำนวนแคลด้วย' : null,
              onSaved: (value) => kcal = value as int,
            ),
            RaisedButton(
              onPressed: addFood,
              child: Text('เพิ่ม'),
            )
          ],
        ),
      ),
    );
  }
}
