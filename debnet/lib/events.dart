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
  final List<String> _allActivities = <String>['Meal', 'Cinema', 'Travel', 'Cafe'];
  final Map<String, Icon> iconMap = <String, Icon>{
    'Meal' : Icon(Icons.local_dining, color: Colors.blue),
    'Cinema' : Icon(Icons.theaters, color: Colors.blue),
    'Travel' : Icon(Icons.airplanemode_active, color: Colors.blue),
    'Cafe' : Icon(Icons.local_cafe, color: Colors.blue),
  };
  String _activity = 'Meal';
  String _eventName = "";
  int _eventCost = 0;
  Set<int> participants = Set<int>();
  Widget build(BuildContext context) {
    List<Widget> users = <Widget>[];
    participants.add(userManager.currentUser);
    for(int i=0; i<userManager.users.length; i++) {
      UserData user = userManager.get(i);
      if(i != userManager.currentUser) {
        users.add(Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.0, -0.5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if(participants.contains(i))
                      participants.remove(i);
                    else participants.add(i);
                  });
                },
                child: Container(
                  height: 128.0,
                  width: 128.0,
                  child: CircleAvatar(backgroundImage: user.profilePicture),
                ),
              ),

            ),
            IgnorePointer(
              child: Align(
                alignment: Alignment(0.0, -0.5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if(participants.contains(i))
                        participants.remove(i);
                      else participants.add(i);
                    });
                  },
                  child: Container(
                    height: 128.0,
                    width: 128.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(participants.contains(i) ? 0.0 : 0.7),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 1.0),
              child: Text(
                user.name,
                textScaleFactor: 1.0,
              ),
            ),

          ],
        ));
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an event'),
        actions: <Widget> [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(IconData(0xe876, fontFamily: 'MaterialIcons'), color: Colors.white),
              iconSize: 35.0,
              onPressed: () {
                eventManager.add(EventData(
                  name: _eventName,
                  time: DateTime.now(),
                  cost: _eventCost,
                  icon: iconMap[_activity],
                  payerID: userManager.getCurrent().userID,
                  participants: participants.toList()));
                eventManager.setCurrent(eventManager.eventIdCount - 1);
                Navigator.pushNamed(context, '/');
              },
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
                onChanged: (String newName) {
                  _eventName = newName;
                },
              ),
              const SizedBox(height: 8.0),
              TextField(
                enabled: true,
                decoration: const InputDecoration(
                  labelText: 'Cost',
                  border: OutlineInputBorder(),
                ),
                style: Theme.of(context).textTheme.body1,
                onChanged: (String newValue) {
                  _eventCost = int.parse(newValue);
                },
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
                padding: EdgeInsets.only(top: 16.0, bottom: 12.0),
                child: Text('Participants:'),
              ),
              Container(
                height: 512.0,
                child: GridView.extent(
                  maxCrossAxisExtent: 256.0,
                  padding: EdgeInsets.all(10.0),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: users,
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
    EventData event = eventManager.getCurrent();
    List<Widget> children = <Widget>[
      ListTile(
        leading: event.icon,
        title: Text(
          event.name,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
        // Add trailing button to remind all?
        subtitle: Text('${event.cost} won\n${event.time.year}/${event.time.month}/${event.time.day}'),
        isThreeLine: true,
      ),
      Divider(),
      ListTile(title: Text('Host:', style: TextStyle(fontWeight: FontWeight.w500),)),
      userManager.get(event.payerID).asListTile(),
      ListTile(title: Text('Participants:', style: TextStyle(fontWeight: FontWeight.w500),)),
    ];
    for(int i=0; i<event.participants.length; i++) {
      int userID = event.participants[i];
      if(userID != event.payerID)
        children.add(userManager.get(userID).asListTile());
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text('Event'),
      ),
      body: Card(
        child: ListView(
//          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      )
    );
  }
}