import 'package:appgill01/mode/authentication.dart';
import 'package:appgill01/screens/Admin/adminhome.dart';
import 'package:appgill01/screens/Homepage.dart';
import 'package:appgill01/screens/home_screen.dart';
import 'package:appgill01/screens/login_screen.dart';
import 'package:appgill01/screens/signup_screen.dart';
import 'package:appgill01/screens/signup_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: Authentication(),
        )
      ],
      
      child: MaterialApp(
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.blue,
          textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).
            textTheme),
        primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          SignupScreen.routeName: (ctx)=> SignupScreen(),
          LoginScreen.routeName: (ctx)=> LoginScreen(),
          HomeScreen.routeName: (ctx)=> HomeScreen(),
          Homepage.routeName: (ctx)=> Homepage(),
          SignupTest.routeName: (ctx)=> SignupTest(),
        },
      ),
      
    );
    

  }
}
