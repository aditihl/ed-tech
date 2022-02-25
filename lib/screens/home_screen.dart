import 'dart:io';

import 'package:flutter/material.dart';
import 'package:edvance/event_info.dart';
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
    return Scaffold(body: Center(child: ElevatedButton(child: Text('Insert'),onPressed: (){

      insert(title: "Event", description: "My Event", location: "Jaipur" , shouldNotifyAttendees: true, hasConferenceSupport: true);
    },),),);
  }

  Future<Map<String, String>> insert({
    @required String title="Event",
    @required String description="kj",
    @required String location="",
     // List<EventAttendee> attendeeEmailList,
    @required bool shouldNotifyAttendees=true,
    @required bool hasConferenceSupport=true,

  }) async {
    DateTime startTime=DateTime.now();
    DateTime endTime=startTime.add(Duration(hours: 1));
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
    event.location = location;

    if (hasConferenceSupport) {

      ConferenceData conferenceData = ConferenceData();
      CreateConferenceRequest conferenceRequest = CreateConferenceRequest();
      conferenceRequest.requestId = "${startTime.millisecondsSinceEpoch}-${endTime.millisecondsSinceEpoch}";
      conferenceData.createRequest = conferenceRequest;

      event.conferenceData = conferenceData;
    }

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
          conferenceDataVersion: hasConferenceSupport ? 1 : 0, sendUpdates: shouldNotifyAttendees ? "all" : "none")
          .then((value) {
        print("Event Status: ${value.status}");
        if (value.status == "confirmed") {
          String joiningLink="";
          String eventId;
          eventId = value.id!;
          if (hasConferenceSupport) {
            joiningLink = "https://meet.google.com/${value.conferenceData?.conferenceId}";
          }
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
