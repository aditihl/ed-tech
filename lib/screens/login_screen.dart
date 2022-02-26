import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edvance/screens/home_screen.dart';
import 'package:edvance/screens/role_screen.dart';
import 'package:edvance/screens/student.dart';
import 'package:edvance/screens/teacher.dart';
import 'package:edvance/session_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/classroom/v1.dart';

class LoginScreen extends StatefulWidget {
   GoogleSignIn? googleSignIn;
   LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4d194f),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              "assets/images/logo.png",
              height: 300,
              fit: BoxFit.fill,
            ),
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Align(
                    alignment: Alignment(0.023, 0.447),
                    child: SizedBox(
                      width: 254.0,
                      height: 84.0,
                      child: Text(
                        'We currently have over \n740 live roles waiting for you!',
                        style: TextStyle(
                          fontFamily: 'Apple SD Gothic Neo',
                          fontSize: 20,
                          color: Color(0xff4d194f),
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  SignInButton(
                    Buttons.Google,
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(color: Color(0xff4d194f))),
                    onPressed: () async {
                      loginScreen();
                    },
                  ),
                  const Text.rich(
                    const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Apple SD Gothic Neo',
                        fontSize: 20,
                        color: Color(0xff4d194f),
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'By creating an account, you are agree \nto our',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: Color(0xffcd1b5a),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  loginScreen() async {
    UserCredential user = await signInWithGoogle();
    if (user.user != null) {
      FirebaseFirestore.instance
          .collection("users")
          .snapshots()
          .listen((event) {
        List<QueryDocumentSnapshot> q = event.docs
            .where((element) => element.data()['id'] == user.user!.uid)
            .toList();
        if (q.isNotEmpty) {
          QueryDocumentSnapshot query = q[0];

          Map<dynamic, dynamic>? mapData = query.data() as Map?;
          if (mapData != null &&
              mapData.containsKey("role") &&
              mapData['role'] != null) {
            // if (!mounted) {
              SessionManager().setUserRole( mapData['role']);
              redirectToHomeScreen();
            // }
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

  void redirectToHomeScreen() async{
    String role=await SessionManager().getUserRole();
    print(role);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (buil) => role=="Student"?const StudentHome(): const TeacherHome()), (route) => false);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow

    widget.googleSignIn= GoogleSignIn(      scopes: [
      ClassroomApi.classroomCoursesScope,
      ClassroomApi.classroomCoursesReadonlyScope,
      ClassroomApi.classroomRostersScope,
      ClassroomApi.classroomRostersReadonlyScope,
    ],);
    final GoogleSignInAccount? googleUser = await widget.googleSignIn!.signIn();

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
