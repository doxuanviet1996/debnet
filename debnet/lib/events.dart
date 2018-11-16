import 'package:flutter/material.dart';

List<Widget> list = <Widget>[
  ListTile(
    title: Text('Batman',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('Lotte Cinema'),
    leading: Icon(
      Icons.theaters,
      color: Colors.deepOrange,
    ),
  ),
  ListTile(
    title: Text('Avenger',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('Gungdong'),
    leading: Icon(
      Icons.theaters,
      color: Colors.deepOrange,
    ),
  ),
  ListTile(
    title: Text('Trilgu',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('79 Gungdong'),
    leading: Icon(
      IconData(0xe56c, fontFamily: 'MaterialIcons'),
      color: Colors.deepOrange
    ),
  ),
];

class Events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('List of events'),
      ),
      body: Center(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}

class EventCreation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>new _EventCreationState();
}

class _EventCreationState extends State<EventCreation> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Create an event'),
      ),
      body: Center(
        child: Text('Say meomeo'),
      ),
    );
  }
}