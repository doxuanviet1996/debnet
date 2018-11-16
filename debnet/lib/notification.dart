import 'package:flutter/material.dart';

List<Widget> list = <Widget>[
  ListTile(
    title: Text('Van tra no 5000 won',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
    subtitle: Text('An trilgu - Yesterday'),
    leading: Icon(
      IconData(0xe227, fontFamily: 'MaterialIcons'),
      color: Colors.deepOrange
    ),
  ),
  ListTile(
    title: Text('Viet set keo AOE chat tay voi ban',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
    subtitle: Text('Nhan keo ko em?'),
    leading: Icon(
      IconData(0xe614, fontFamily: 'MaterialIcons'),
      color: Colors.deepOrange
    ),
  ),
  ListTile(
    title: Text('Viet nhac ban tra no Viet 1 qua tao',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
    subtitle: Text('An qua nho ke trong cay'),
    leading: Icon(
      IconData(0xe227, fontFamily: 'MaterialIcons'),
      color: Colors.deepOrange
    ),
  ),
];

class Notifications extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>new _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}