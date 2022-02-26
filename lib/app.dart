
import 'package:edvance/screens/home_screen.dart';
import 'package:edvance/screens/login_screen.dart';
import 'package:edvance/screens/student.dart';
import 'package:edvance/screens/teacher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyApp extends StatelessWidget {
  bool isAuth;
  String role;
   MyApp({Key? key,this.isAuth=false, this.role="Student"}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   User? user= FirebaseAuth.instance.currentUser;
    isAuth =user !=null;
    print(' user Auth $user $isAuth');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff541452),
          appBarTheme: AppBarTheme(
            color: const Color(0xff541452),
          )
        // primarySwatch: Color(0xffcd1b5a),
      ),
      debugShowCheckedModeBanner: false,
      home:!isAuth? LoginScreen():role=="Student"?const StudentHome(): const TeacherHome(),
      // home:LoginnScreen()
    );
  }
}
