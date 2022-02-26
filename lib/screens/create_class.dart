import 'package:edvance/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
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
  Map<String,String>? event;
  TextEditingController _className=TextEditingController();
  TextEditingController _classSection=TextEditingController();
   GoogleSignInAccount? googleUser;
  @override
  void initState() {
    createGoogle();
    super.initState();
  }
  createGoogle()async {
    googleUser = await GoogleSignIn(
      scopes: [
        ClassroomApi.classroomCoursesScope,
        ClassroomApi.classroomCoursesReadonlyScope,
        ClassroomApi.classroomRostersScope,
        CalendarApi.calendarEventsScope,
        CalendarApi.calendarScope,
        ClassroomApi.classroomRostersReadonlyScope,
        ClassroomApi.classroomProfileEmailsScope,
        ClassroomApi.classroomProfilePhotosScope,

      ],
    ).signIn();
  }
  @override
  Widget build(BuildContext context)
  {
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
                Text('Create Class')
              ],
            ),
            // centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                TextField(
                  controller: _className,
                  decoration: InputDecoration(labelText: 'Enter Class Name'),
                ),
                TextField(
                  controller: _classSection,
                  decoration: InputDecoration(labelText: 'Enter Section'),
                ),

                ElevatedButton(
                  child: Text('Continue'),
                  onPressed: () async{

                    DateTime startTime=DateTime.now();
                    DateTime endTime=startTime.add(Duration(hours: 1));
                    event=await createMeetLink(title: _className.text, description: _classSection.text,startTime: startTime,endTime:endTime);

                    createClass(
                        title: _className.text, section: _classSection.text);
                  },
                ),
              ],
            ),
          )),
    );
  }

  Future<Map<String, String>> createMeetLink({
    required String title,
    required String description,
    required DateTime startTime,
    required DateTime endTime
    // List<EventAttendee> attendeeEmailList,

  }) async {
    List<EventAttendee> attendeeEmailList=[];
    attendeeEmailList.add(EventAttendee(email: "aditi4jan@gmail.com"));
    Map<String, String> eventData={};
    String calendarId = "primary";
    Event event = Event();

    event.summary = title;
    event.description = description;
    event.attendees = attendeeEmailList;
    event.location = "";

    ConferenceData conferenceData = ConferenceData();
    CreateConferenceRequest conferenceRequest = CreateConferenceRequest();
    conferenceRequest.requestId = "${startTime.millisecondsSinceEpoch}-${endTime.millisecondsSinceEpoch}";
    conferenceData.createRequest = conferenceRequest;

    event.conferenceData = conferenceData;

    EventDateTime start = new EventDateTime();
    start.dateTime = startTime;
    start.timeZone = "GMT+05:30";
    event.start = start;

    EventDateTime end = new EventDateTime();
    end.timeZone = "GMT+05:30";
    end.dateTime = endTime;
    event.end = end;

    try {


      final GoogleAPIClient httpClient =
      GoogleAPIClient(await googleUser!.authHeaders);

      CalendarApi calendarApi  = CalendarApi(httpClient);
      await calendarApi.events
          .insert(event, calendarId,
          conferenceDataVersion: 1, sendUpdates: "all")
          .then((value) {
        print("Event Status: ${value.status}");
        if (value.status == "confirmed") {
          String  joiningLink = "https://meet.google.com/${value.conferenceData?.conferenceId}";
          String eventId;
          eventId = value.id!;

          eventData = {'id': eventId, 'link': joiningLink};
          print('Event added to Google Calendar');
        } else {
          print("Unable to add event to Google Calendar");
        }
      });
    } catch (e) {
      print('Error creating event $e');
    }

    return eventData;
  }
  Future<Map<String, String>> createClass({
    required String title,
    required String section,
  }) async {
    Map<String, String> cousre = {};
    try {

      final GoogleAPIClient httpClient =
          GoogleAPIClient(await googleUser!.authHeaders);

      ClassroomApi calendarApi = ClassroomApi(httpClient);
      await calendarApi.courses
          .create(Course(name: title, section: section, ownerId: googleUser!.id,description: event!['link']))
          .then((value) {
        print(value.id);
if(value.id!=null) {



  // calendarApi.invitations.list().then((value) => print(value
  // ));
}
        // }
      });

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
