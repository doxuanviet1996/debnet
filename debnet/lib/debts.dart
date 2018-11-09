import 'package:flutter/material.dart';

class Debts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DebtsState();
}

class _DebtsState extends State<Debts> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('List of debts'),
      ),
      body: Center(
        child: Text('Say gaugau'),
      ),
    );
  }
}