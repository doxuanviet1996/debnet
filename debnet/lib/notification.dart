import 'package:flutter/material.dart';

import 'database.dart';

class Notifications extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>new _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    for(int i=userManager.getCurrent().notifications.length-1; i>=0; i--) {
      Noti noti = userManager.getCurrent().notifications[i];
      children.add(GestureDetector(
        onTap: () {
          if(userManager.getCurrent().notifications[i].viewed == false) {
            userManager.getCurrent().newNoti--;
            userManager.getCurrent().notifications[i].viewed = true;
          }
          eventManager.setCurrent(noti.eventID);
          Navigator.pushNamed(context, '/events/event');
        },
        child: ListTile(
          title: Text(
            noti.content,
            style: TextStyle(
                fontWeight: noti.viewed ? FontWeight.w100 : FontWeight.w500,
                fontSize: 16.0),
          ),
          leading: noti.icon,
          subtitle: Text(noti.subContent),
        ),
      ));
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: ListView(
          children: children,
        ),
      ),
    );
  }
}