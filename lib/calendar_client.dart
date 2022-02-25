import 'package:googleapis/calendar/v3.dart';

class CalendarClient {
  // For storing the CalendarApi object, this can be used
  // for performing all the operations
  static var calendar;

  // For creating a new calendar event
  // Future<Map<String, String>> insert({
  //    String? title,
  //    String? description,
  //    String? location,
  //    List<EventAttendee>? attendeeEmailList,
  //    bool? shouldNotifyAttendees,
  //    bool? hasConferenceSupport,
  //    DateTime? startTime,
  //    DateTime? endTime,
  // }) async {
  //   return  null;
  // }
  
  // // For patching an already-created calendar event
  // Future<Map<String, String>> modify({
  //    String? id,
  //    String? title,
  //    String? description,
  //    String? location,
  //    List<EventAttendee>? attendeeEmailList,
  //    bool? shouldNotifyAttendees,
  //    bool? hasConferenceSupport,
  //    DateTime? startTime,
  //    DateTime? endTime,
  // }) async {
    
  // }
  
  // For deleting a calendar event
  Future<void> delete(String eventId, bool shouldNotify) async {}
}