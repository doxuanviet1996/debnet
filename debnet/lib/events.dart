import 'package:flutter/material.dart';

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
        child: Text('Say meomeo'),
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