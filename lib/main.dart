
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:edvance/secret.dart';
import 'package:edvance/calendar_client.dart';

import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool isAuth=(FirebaseAuth.instance.currentUser!=null);

  print(FirebaseAuth.instance.currentUser);
  print(isAuth);
  runApp( MyApp(isAuth:isAuth));
}

void prompt(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


