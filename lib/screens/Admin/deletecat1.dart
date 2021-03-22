import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appgill01/screens/Category1.dart';

class deletecat1 extends StatefulWidget {
  @override
  _deletecat1State createState() => _deletecat1State();
}


class _deletecat1State extends State<deletecat1> {
  @override
  Widget build(BuildContext context) {
    CollectionReference Category1 = FirebaseFirestore.instance.collection('Category1');

Future<void> deleteUser() {
  return Category1
    .doc('ABC123')
    .delete()
    .then((value) => print("User Deleted"))
    .catchError((error) => print("Failed to delete user: $error"));
}
  }
}