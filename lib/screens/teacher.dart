import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edvance/screens/CourseDetail.dart';
import 'package:edvance/screens/create_class.dart';
import 'package:edvance/session_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_screen.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
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
          actions: [IconButton(icon: Icon(Icons.logout),onPressed: ()async {
            GoogleSignInAccount? acc=await GoogleSignIn().signOut();
            await FirebaseAuth.instance.signOut();
            print(acc);
            if(acc==null){
              SessionManager().clearPref();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder)=>LoginScreen()), (route) => false);
            }
          },)],
          // centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)),
          ),
          child: ListView(
            children: course.map((Course document) {
              return snapshotList(document);
            }).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (builder) => CreateClass()));
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget snapshotList(Course document) {
    print(document.alternateLink);
    return InkWell(
      onTap: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (builder) => CourseDetail(course: document)));
      },
      child: Container(
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
            if(document.description!=null)
            TextButton(
              style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(0),)),
              onPressed: (){
               try{
                 launch("${document.description}");
               }catch(e){
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
      ),
    );
  }
}
