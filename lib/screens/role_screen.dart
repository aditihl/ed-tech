import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edvance/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  _RoleScreenState createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  User? _user;
  String? role;

  @override
  Widget build(BuildContext context) {
    _user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        children: [
          Text("Welcome"),
          Text("${_user!.email}"),
          Text('select your Role to continue'),
          TextButton(
              onPressed: () {
                role = "Student";
                setState(() {});
              },
              child: Wrap(children: [
                Text('Student'),
                if (role != null && role == "Student") Icon(Icons.check)
              ], direction: Axis.horizontal)),
          TextButton(
              onPressed: () {
                role = "Teacher";
                setState(() {});
              },
              child: Wrap(children: [
                Text('Teacher'),
                if (role != null && role == "Teacher") Icon(Icons.check)
              ], direction: Axis.horizontal)),

          ElevatedButton(child: Text('Continue'),onPressed: ()async {
            // DocumentSnapshot documentSnapshot = await FirebaseFirestore
            //     .instance
            //     .collection("users")
            //     .doc(_user!.uid)
            //     .get()
            //     .catchError((onError) {});
            // print(documentSnapshot);
            FirebaseFirestore.instance.collection("users").doc(_user!.uid).set({
              'name': _user!.displayName, // John Doe
              'id': _user!.uid, // Stokes and Sons
              'email': _user!.email, //
              'role':role// 42
            });
            redirectToHomeScreen();
          },)
        ],
      ),
    );
  }
  void redirectToHomeScreen() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (buil) => HomeScreen()), (route) => false);
  }
}
