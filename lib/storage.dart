import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edvance/event_info.dart';

import 'package:flutter/material.dart';

final CollectionReference mainCollection = FirebaseFirestore.instance.collection('event');
final DocumentReference documentReference = mainCollection.doc('test');

class Storage {
  Future<void> storeEventData(EventInfo eventInfo) async {}

  Future<void> updateEventData(EventInfo eventInfo) async {}

  Future<void> deleteEvent({required String id}) async {}

//Stream<QuerySnapshot> retrieveEvents() {}
}