import 'package:edvance/ChatScreen.dart';
import 'package:edvance/CourseScreen.dart';
import 'package:edvance/CreateCourse.dart';
import 'package:edvance/LoginScreen.dart';
import 'package:edvance/MeetScreen.dart';
import 'package:edvance/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyApp extends StatelessWidget {
  bool isAuth;
  MyApp({Key? key, this.isAuth = false}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = GoogleSignIn().currentUser;
    isAuth = user != null;
    // !isAuth ?const LoginnScreen():
    print(' user Auth $isAuth');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CourseScreen(),
    );
  }
}
