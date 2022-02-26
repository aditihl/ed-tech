import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edvance/screens/create_class.dart';
import 'package:flutter/material.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
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
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('class').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Center(child: Text('Loading...'));
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return snapshotList(document);
                }).toList(),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> CreateClass()));
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget snapshotList(document) {
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
      child: const Text(
        'Maths Class',
        style: TextStyle(
          fontFamily: 'Apple SD Gothic Neo',
          fontSize: 23,
          color: Color(0xffffffff),
          fontWeight: FontWeight.w500,
          height: 1.0714285714285714,
        ),
        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.center,
        softWrap: false,
      ),
    );
  }
}
