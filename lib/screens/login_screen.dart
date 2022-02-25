import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edvance/screens/home_screen.dart';
import 'package:edvance/screens/role_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SignInButton(
              Buttons.Google,
              onPressed: () async {

              },
            ),
          ),
        ],
      ),
    );
  }

  loginScreen()  async {
    UserCredential user = await signInWithGoogle();
    if (user.user != null) {
      FirebaseFirestore.instance
          .collection("users")
          .snapshots()
          .listen((event) {
        List<QueryDocumentSnapshot> q = event.docs
            .where(
                (element) => element.data()['id'] == user.user!.uid)
            .toList();
        if (q.isNotEmpty) {
          QueryDocumentSnapshot query = q[0];

          Map<dynamic, dynamic>? mapData = query.data() as Map?;
          if (mapData!=null && mapData.containsKey("role") &&
              mapData['role'] != null) {
            redirectToHomeScreen();
          } else {
            redirectToRoleScreen();
          }
        } else {
          redirectToRoleScreen();
        }
      });
    }
  }

  redirectToRoleScreen() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (buil) => RoleScreen()), (route) => false);
  }

  void redirectToHomeScreen() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (buil) => HomeScreen()), (route) => false);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
