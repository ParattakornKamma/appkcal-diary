// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:gill00/models/cartoon_model.dart';

// class HomeScreen extends StatefulWidget {
//   static const routeName = '/home';
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Widget> widgets = [];

//   @override
//   void initState() {
//     super.initState();
//     readData();
//   }

//   Future<Null> readData() async {
//     await Firebase.initializeApp().then((value) async {
//       print('object');
//       await FirebaseFirestore.instance
//           .collection('Category1')
//           .snapshots()
//           .listen((event) {
//         print('snapshot = ${event.docs}');
//         for (var snapshot in event.docs) {
//           Map<String, dynamic> map = snapshot.data();
//           print('map = $map');
//           CartooModel model = CartooModel.fromMap(map);
//           print('Name = ${model.Name}');
//           setState(() {
//             widgets.add(createWidget(model));
//           });
//         }
//       });
//     });
//   }

//   Widget createWidget(CartooModel model)=> Card(
//     child: Column(
//       children: [
//         Container(
//           width: 100,
//           child: Image.network(model.pdf),
//         ),Text(model.Name),
//       ],
//     ),
//   );

//   @override  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widgets.length == 0 ? Center(child: CircularProgressIndicator()): GridView.extent(
//         maxCrossAxisExtent: 200,
//         children: [],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text(
          'This is my home screen', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),
      ),
    );
  }
}