import 'package:flutter/material.dart';

import 'database.dart';

class PaymentsHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PaymentsHistoryState();
}

class _PaymentsHistoryState extends State<PaymentsHistory> {
  @override
  Widget build(BuildContext context) {
    List<DebtData> debts = userManager.getDebts();
    List<Widget> children = <Widget>[];
    for(int i=debts.length-1; i>=0; i--) {
      if(debts[i].done == 1) {
        EventData event = eventManager.get(debts[i].eventID);
        children.add(ListTile(
          title: Text(
            debts[i].host == userManager.currentUser
                ? '${userManager.get(debts[i].client).name} paid you ${debts[i].amount} won'
                : 'You paid ${userManager.get(debts[i].host).name} ${debts[i].amount} won',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18.0),
          ),
          leading: event.icon,
          subtitle: Text(
              '${event.name} - ${event.time.year}/${event.time.month}/${event
                  .time.day}'),
        ));
      }
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text('Payments History'),
      ),
      body: ListView(
        children: children,
      ),
    );
  }
}