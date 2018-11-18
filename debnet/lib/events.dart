import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[
      ListTile(
        title: Text('Batman',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: Text('Lotte Cinema'),
        leading: Icon(Icons.theaters, color: Colors.deepOrange,),
        onTap: () {
          Navigator.pushNamed(context, '/events/event');
          },
      ),
      ListTile(
        title: Text('Avenger',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: Text('Gungdong'),
        leading: Icon(Icons.theaters, color: Colors.deepOrange,),
        onTap: () {
          Navigator.pushNamed(context, '/events/event');
          },
      ),
      ListTile(
        title: Text('Trilgu',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: Text('79 Gungdong'),
        leading: Icon(IconData(0xe56c, fontFamily: 'MaterialIcons'), color: Colors.deepOrange),
      ),
    ];
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
  final List<String> _allActivities = <String>['Eating', 'Filming', 'Travelling', 'Drinking'];
  String _activity = 'Eating';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an event'),
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
                style: Theme.of(context).textTheme.display1,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                style: Theme.of(context).textTheme.display1.copyWith(fontSize: 20.0),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Date',
                ),
                style: Theme.of(context).textTheme.display1.copyWith(fontSize: 20.0),
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
        title: Text('Event'),
      ),
      body: Center(
        child: Text('Say meomeo'),
      ),
    );
  }
}