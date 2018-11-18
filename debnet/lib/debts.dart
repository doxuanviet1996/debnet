import 'package:flutter/material.dart';

class Debts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DebtsState();
}

class _DebtsState extends State<Debts> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[
      ListTile(
        title: Text('No Viet 4500',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: Text('23/10/2018 - An trilgu'),
      ),
      ListTile(
        title: Text('Viet no 1,000,000,000 won',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: Text('Yesterday - Thua keo AOE'),
      ),
      ListTile(
        title: Text('Chua nghi ra',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: Text('Chua nghi ra'),
      ),
    ];
    return new Scaffold(
      appBar: AppBar(
        title: Text('List of debts'),
      ),
      body: Center(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}