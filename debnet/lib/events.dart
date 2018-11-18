import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'database.dart';

class Events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    List<Widget> res = <Widget>[
    ];
    for(int i=eventManager.events.length - 1; i>=0; i--) {
      EventData event = eventManager.get(i);
      res.add(ListTile(
        title: Text(event.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
        subtitle: Text('${event.time.year}/${event.time.month}/${event.time.day}'),
        leading: event.icon,
        onTap: () {
          eventManager.currentEvent = event.eventID;
          Navigator.pushNamed(context, '/events/event');
        },
      ));
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text('List of events'),
      ),
      body: Center(
        child: ListView(
          children: res,
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
  final List<String> _allActivities = <String>['Eating', 'Filming', 'Travelling', 'Drinking'];
  String _activity = 'Eating';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an event'),
        actions: <Widget> [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(IconData(0xe876, fontFamily: 'MaterialIcons'), color: Colors.white),
              iconSize: 35.0,
            ),
          ),  
        ],
      ),
      body: DropdownButtonHideUnderline(
        child: SafeArea(
          top: false,
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              TextField(
                enabled: true,
                decoration: const InputDecoration(
                  labelText: 'Event name',
                  border: OutlineInputBorder(),
                ),
                style: Theme.of(context).textTheme.subhead,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Date',
                ),
                style: Theme.of(context).textTheme.subhead,
              ),
              const SizedBox(height: 8.0),
              InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Activity',
                  hintText: 'Choose an activity',
                  contentPadding: EdgeInsets.zero,
                ),
                isEmpty: _activity == null,
                child: DropdownButton<String>(
                  value: _activity,
                  onChanged: (String newValue) {
                    setState(() {
                      _activity = newValue;
                    });
                  },
                  items: _allActivities.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                height: 512.0,
                child: GridView.extent(
                  maxCrossAxisExtent: 120.0,
                  padding: EdgeInsets.all(20.0),
                  mainAxisSpacing: 50.0,
                  crossAxisSpacing: 50.0,
                  children: List<Container>.generate(12, (int index) {
                    return Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/vanh${index+1}.jpg'),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Event extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>new _Event();
}

class _Event extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(eventManager.getCurrent().name),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, -0.5),
            child: Container(
              height: 300.0,
              width: 300.0,
              child: CircleAvatar(backgroundImage: AssetImage('images/vanh1.jpg'),),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.5),
            child: Text(
              'Dm vanh',
              textScaleFactor: 2.0,
//              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}