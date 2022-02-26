import 'package:edvance/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:url_launcher/url_launcher.dart';

import '../secret.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({Key? key}) : super(key: key);

  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Create Class'),
          TextField(
            decoration: InputDecoration(labelText: 'Enter Class Name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Enter Section'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Enter Subject'),
          ),
          ElevatedButton(
            child: Text('Continue'),
            onPressed: () {
              createClass(
                  title: "Class-1", section: "A", subject: "Mathematics");
            },
          ),
        ],
      ),
    );
  }

  Future<Map<String, String>> createClass({
    required String title,
    required String section,
    required String subject,
    // List<EventAttendee> attendeeEmailList,
  }) async {
    Map<String, String> cousre = {};
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: [
          ClassroomApi.classroomCoursesScope,
          ClassroomApi.classroomCoursesReadonlyScope,
          ClassroomApi.classroomRostersScope,
          ClassroomApi.classroomRostersReadonlyScope,
        ],
      ).signIn();
      final GoogleAPIClient httpClient =
      GoogleAPIClient(await googleUser!.authHeaders);

      ClassroomApi calendarApi = ClassroomApi(httpClient);
      print("Aditi");
      // calendarApi.courses.list().then((value) {
      //   print(value);
      //   print(value.courses);
      //
      // });
      await calendarApi.courses
          .create(Course(
        name: title,
        section: section,
      ))
          .then((value) {
        print(value);
        // }
      });
      // await clientViaUserConsent(_clientID, _scopes, prompt)
      //     .then((AuthClient client) async {
      //
      // });
    } catch (e) {
      print('Error creating event $e');
    }

    return cousre;
  }

  void prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class GoogleAPIClient extends IOClient {
  final Map<String, String> _headers;

  GoogleAPIClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url, headers: headers?..addAll(_headers));
}
