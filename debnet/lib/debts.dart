import 'package:flutter/material.dart';

import 'database.dart';

class Debts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DebtsState();
}

class _DebtsState extends State<Debts> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    List<DebtData> debts = userManager.getDebts();
    List<Widget> children = <Widget>[];
    for(int i=debts.length-1; i>=0; i--) {
      EventData event = eventManager.get(debts[i].eventID);
      if(debts[i].done == 1) {
        children.add(ListTile(
          title: Text(
            debts[i].host == userManager.currentUser
              ? '${userManager.get(debts[i].client).name} owed you ${debts[i].amount} won'
              : 'You owed ${userManager.get(debts[i].host).name} ${debts[i].amount} won',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18.0),
          ),
          leading: event.icon,
          subtitle: Text('${event.name} - ${event.time.year}/${event.time.month}/${event.time.day}'),
        ));
      }
      // Green
      else if(debts[i].host == userManager.currentUser) {
        children.add(GestureDetector(
          onTap: () {
            // Remind
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Remind ${userManager.get(debts[i].client).name}?'),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text('OK'),
                      onPressed: () {
                        userManager.get(debts[i].client).addNoti(Noti(
                          eventID: event.eventID,
                          content: '${userManager.get(debts[i].host).name} reminds you to pay.',
                          subContent: '${event.name} - ${event.time.year}/${event.time.month}/${event.time.day}',
                        ));
                        Navigator.pop(context);
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Done'),
                        ));
                      },
                    ),
                    FlatButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: ListTile(
            title: Text(
              '${userManager.get(debts[i].client).name} owed you ${debts[i].amount} won',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: Colors.green),
            ),
            leading: event.icon,
            subtitle: Text('${event.name} - ${event.time.year}/${event.time.month}/${event.time.day}'),
          ),
        ));
      }
      // Red
      else {
        children.add(GestureDetector(
          onTap: () {
            // Payment
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Make payment?'),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text('OK'),
                      onPressed: () {
                        debts[i].makePayment();
                        Navigator.pop(context);
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Done'),
                        ));
                        setState(() {});
                      },
                    ),
                    FlatButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: ListTile(
            title: Text(
              'You owed ${userManager.get(debts[i].host).name} ${debts[i].amount} won',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: Colors.red),
            ),
            leading: event.icon,
            subtitle: Text('${event.name} - ${event.time.year}/${event.time.month}/${event.time.day}'),
          ),
        ));
      }
    }
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('List of debts'),
      ),
      body: Center(
        child: ListView(
          children: children,
        ),
      ),
    );
  }
}