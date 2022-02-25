import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edvance/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:edvance/event_info.dart';
import 'package:googleapis/classroom/v1.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';
import 'package:edvance/calendar_client.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

import '../secret.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      children: [
        ElevatedButton(child: Text('Create Class'),onPressed: ()async{
          DocumentReference d=await FirebaseFirestore.instance.collection("classroom").add({
            'class_id':'RKxZTmea7C29OedWfSH0',
            "section":'A',
            'start_date':DateTime.now(),
            "end_date":DateTime.now().add(Duration(hours: 1)),
            "meetLink":"",
            "Days":["Monday"],
          });
          //add Sections
          
        },),
        ElevatedButton(child: Text('Insert'),onPressed: (){
          DateTime startTime=DateTime.now();
          DateTime endTime=startTime.add(Duration(hours: 1));
          insert(title: "Event", description: "My Event",startTime: startTime,endTime:endTime);
        },),
        ElevatedButton(onPressed: ()async {
          GoogleSignInAccount? acc=await GoogleSignIn().signOut();
          print(acc);
          if(acc==null){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder)=>LoginScreen()), (route) => false);
          }
        }, child: Text('Logout'))
      ],
    ),),);
  }

  Future<Map<String, String>> insertClassRoom({
    required String title,
    required String description,
    required DateTime startTime,
    required DateTime endTime
    // List<EventAttendee> attendeeEmailList,

  }) async {
    Map<String, String> cousre={};

    // If the account has multiple calendars, then select the "primary" one

    try {

      var _clientID =  ClientId(Secret.getId(), "");
      const _scopes = [ClassroomApi.classroomCoursesScope];

      await clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client) async {
        ClassroomApi calendarApi  = ClassroomApi(client);
        await calendarApi.courses.create(Course())
            .then((value) {

          // print("Event Status: ${value.status}");
          // if (value.status == "confirmed") {
          //   String  joiningLink = "https://meet.google.com/${value.conferenceData?.conferenceId}";
          //   String eventId;
          //   eventId = value.id!;
          //
          //   eventData = {'id': eventId, 'link': joiningLink};
          //   print('Event added to Google Calendar');
          // } else {
          //   print("Unable to add event to Google Calendar");
          // }
        });
      });

      // final calendarApi=CalendarApi(httpClient);
      // final googleAPI.CalendarApi calendarAPI = googleAPI.CalendarApi(httpClient);

    } catch (e) {
      print('Error creating event $e');
    }

    return cousre;
  }

  Future<Map<String, String>> insert({
    required String title,
    required String description,
    required DateTime startTime,
    required DateTime endTime
     // List<EventAttendee> attendeeEmailList,

  }) async {

    List<EventAttendee> attendeeEmailList=[];
    attendeeEmailList.add(EventAttendee(email: "aditi4jan@gmail.com"));
    attendeeEmailList.add(EventAttendee(email: "mittalpiyush143@gmail.com"));
    Map<String, String> eventData={};

    // If the account has multiple calendars, then select the "primary" one
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

      var _clientID =  ClientId(Secret.getId(), "");
      const _scopes = [CalendarApi.calendarScope];
      
  await clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client) async {
    CalendarApi calendarApi  = CalendarApi(client);
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
  });
      
      // final calendarApi=CalendarApi(httpClient);
      // final googleAPI.CalendarApi calendarAPI = googleAPI.CalendarApi(httpClient);
      
    } catch (e) {
      print('Error creating event $e');
    }

    return eventData;
  }

  void prompt(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}
