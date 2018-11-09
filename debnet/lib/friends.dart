import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('List of Friends'),
      ),
      body: Center(
        child: Text('Say meomeo'),
      ),
    );
  }
}