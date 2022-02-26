import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edvance/app_header.dart';
import 'package:edvance/screens/home_screen.dart';
import 'package:edvance/session_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  _RoleScreenState createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  User? _user;
  String role="Teacher";

  @override
  Widget build(BuildContext context) {
    _user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Role'),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Text("Welcome",style:TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),),
            SizedBox(height: 20,),
            Text("${_user!.email}",style:TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),),
SizedBox(height: 50,),
           Column(children: [ Container(
             margin: EdgeInsets.symmetric(horizontal: 30),
             width: double.infinity,
             child: ElevatedButton(
                 onPressed: () {
                   role = "Student";
                   saveRole();
                 },
                 style: ButtonStyle(
                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
                       borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(10),
                           topRight: Radius.circular(30),
                           bottomLeft: Radius.circular(30),
                           bottomRight: Radius.circular(10)),
                     )),backgroundColor: MaterialStateProperty.all(Color(0xffc4d194f))),
                 child: Wrap(children: [
                   Text('Student'),
                   if (role != null && role == "Student") Icon(Icons.check)
                 ], direction: Axis.horizontal)),
           ),
             Container(
               width: double.infinity,
               margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
               child: ElevatedButton(
                   onPressed: () {
                     role = "Teacher";
                     saveRole();
                   },
                   style: ButtonStyle(
                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                         borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(10),
                             topRight: Radius.circular(30),
                             bottomLeft: Radius.circular(30),
                             bottomRight: Radius.circular(10)),
                       )),backgroundColor: MaterialStateProperty.all(Color(0xffc4d194f))),
                   child: Wrap(children: [
                     Text('Teacher'),
                     if (role != null && role == "Teacher") Icon(Icons.check)
                   ], direction: Axis.horizontal)),
             ),],),

          ],
        ),
      ),
    );
  }

  saveRole(){

    FirebaseFirestore.instance
        .collection("users")
        .doc(_user!.uid)
        .set({
      'name': _user!.displayName, // John Doe
      'id': _user!.uid, // Stokes and Sons
      'email': _user!.email, //
      'role': role // 42
    });
    // SessionManager().setUserRole(role);
    redirectToHomeScreen();
  }
  void redirectToHomeScreen() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (buil) => HomeScreen()), (route) => false);
  }
}
