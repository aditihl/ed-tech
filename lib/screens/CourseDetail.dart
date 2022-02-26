import 'package:edvance/screens/create_class.dart';
import 'package:edvance/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetail extends StatefulWidget {
  Course course;

  CourseDetail({Key? key, required this.course}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  GoogleSignInAccount? googleUser;
  bool isAddStudent = false;
  bool isAnnouncement= false;
  TextEditingController _controller = TextEditingController();
  TextEditingController _anncontroller = TextEditingController();
  ClassroomApi? calendarApi;
  List<Student> students = [];
  List<Announcement> announcement = [];
  String role = "Student";

  @override
  void initState() {
    SessionManager().getUserRole().then((value) {
      setState(() {
        role = value;
      });
    });
    createClassRoomAPI();
    super.initState();
  }

  createClassRoomAPI() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: [
        ClassroomApi.classroomRostersScope,
        ClassroomApi.classroomAnnouncementsScope,
        ClassroomApi.classroomAnnouncementsReadonlyScope
      ],
    ).signIn();
    final GoogleAPIClient httpClient =
        GoogleAPIClient(await googleUser!.authHeaders);

    calendarApi = ClassroomApi(httpClient);
    getStudents();
    getAnnList();
    // getInvitations();
  }

  getInvitations() {
    calendarApi!.invitations.get("${widget.course.id}").then((value) {
      print(value);
      // students=value.students!;
      // setState(() {
      //
      // });
    });
  }

  getStudents() {
    calendarApi!.courses.students.list("${widget.course.id}").then((value) {
      print(value.students);
      students = value.students!;
      setState(() {});
    });
  }

  createInvite() async {
    calendarApi!.invitations
        .create(Invitation(
            courseId: widget.course.id,
            role: "STUDENT",
            userId: _controller.text))
        .then((value) {
      _controller.clear();
      print("value in invitation $value");
      getStudents();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invitation Sent'),
      ));
      // print("courses ${value.courses}");
    });
  }

  createAnnouncement() async {
    calendarApi!.courses.announcements
        .create(
            Announcement(
                courseId: "${widget.course.id}", text: _anncontroller.text),
            "${widget.course.id}")
        .then((value) {
          getAnnList();
          _anncontroller.clear();
      print("value in create announcememtn $value");
    });
  }

  getAnnList(){
    calendarApi!.courses.announcements.list("${widget.course.id}").then((value) {
      print("value in view announcememtn $value");
      announcement=value.announcements!;
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.course.name}",
                style: TextStyle(
                  fontFamily: 'Apple SD Gothic Neo',
                  fontSize: 23,
                  color: Theme.of(context).primaryColor,
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
                "Section: ${widget.course.section}",
                style: TextStyle(
                  fontFamily: 'Apple SD Gothic Neo',
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  height: 1.0714285714285714,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
              if (widget.course.description != null)
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                    EdgeInsets.all(0),
                  )),
                  onPressed: () {
                    try {
                      launch("${widget.course.description}");
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    "${widget.course.description}",
                    style: TextStyle(
                      fontFamily: 'Apple SD Gothic Neo',
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      height: 1.0714285714285714,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              if (isAddStudent)
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      decoration:
                          InputDecoration(labelText: 'Enter Student Email'),
                    )),
                    ElevatedButton(
                      child: Text('Send'),
                      onPressed: () {
                        isAddStudent = false;
                        setState(() {});
                        createInvite();
                      },
                    ),
                  ],
                ),
              if(role == "Teacher")
              SizedBox(
                height: 10,
              ),
              if(role == "Teacher")
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Invited Student',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  if (!isAddStudent && role == "Teacher")
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () {
                            isAddStudent = true;
                            setState(() {});
                            // createInvite();
                          },
                          child: Text('Add Student')),
                    ),
                ],
              ),
              if(role == "Teacher")
              SizedBox(
                height: 20,
              ),
              if(role == "Teacher")
              Column(
                children: students.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("- ${e.profile!.name!.fullName!.trim()}"),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              if (isAnnouncement)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextField(
                          controller: _anncontroller,
                          decoration:
                          InputDecoration(labelText: 'Enter Announcement'),
                        )),
                    ElevatedButton(
                      child: Text('Send'),
                      onPressed: () {
                        isAnnouncement = false;
                        setState(() {});
                        createAnnouncement();
                      },
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Announcements',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    if (!isAnnouncement && role == "Teacher")
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () {
                            isAnnouncement = true;
                            setState(() {});
                            // createInvite();
                          },
                          child: Text('Add Announcements')),
                    ),
                  ],
                ),

              Column(
                children: announcement.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${e.text}"),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
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
            Text('Class Detail')
          ],
        ),
        // centerTitle: true,
      ),
    );
  }
}
