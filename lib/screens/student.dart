import 'package:edvance/screens/create_class.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  List<Course> course = [];

  @override
  void initState() {
    getClassList();
    super.initState();
  }

  getClassList() async {
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
    calendarApi.courses.list().then((value) {
      course = value.courses!;
      setState(() {});
      print(value);
      print(value.courses);

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: Wrap(
            direction: Axis.horizontal,
            children: [
              Icon(Icons.sticky_note_2_rounded),
              SizedBox(
                width: 10,
              ),
              Text('Classes')
            ],
          ),
          // centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: ListView(
            children: course.map((Course document) {
              return snapshotList(document);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget snapshotList(Course document) {
    print(document.alternateLink);
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${document.name}",
            style: TextStyle(
              fontFamily: 'Apple SD Gothic Neo',
              fontSize: 23,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
              height: 1.0714285714285714,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Section: ${document.section}",
            style: TextStyle(
              fontFamily: 'Apple SD Gothic Neo',
              fontSize: 12,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
              height: 1.0714285714285714,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
          if (document.description != null)
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                EdgeInsets.all(0),
              )),
              onPressed: () {
                try {
                  launch("${document.description}");
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                "${document.description}",
                style: TextStyle(
                  fontFamily: 'Apple SD Gothic Neo',
                  fontSize: 12,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  height: 1.0714285714285714,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
        ],
      ),
    );
  }
}
