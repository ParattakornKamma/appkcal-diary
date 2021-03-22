import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appgill01/screens/Category1.dart';
  
class Showusers extends StatelessWidget {
  final String Name;
  final int Kcal;
  final String Type;

  Showusers(this.Name, this.Kcal, this.Type);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference Category1 = FirebaseFirestore.instance.collection('Category1');

    Future<void> addFood() {
      // Call the user's CollectionReference to add a new user
      return Category1
          .add({
            'Name': Name, // John Doe
            'Kcal': Kcal, // Stokes and Sons
            'Type': Type,
          })
          .then((value) => print("สำเร็จ"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Center(
      child: FlatButton(
        onPressed: addFood,
        child: Text(
          "เพิ่ม",
        ),
      ),
    );
  }
}