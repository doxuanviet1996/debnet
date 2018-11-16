import 'package:flutter/material.dart';

List<Container> _buildGridTileList(int count) {

  return List<Container>.generate(
      count,
      (int index) =>
          Container(child: CircleAvatar(backgroundImage: AssetImage('images/vanh${index+1}.jpg'))));
}

Widget buildGrid() {
  return GridView.extent(
      maxCrossAxisExtent: 120.0,
      padding: EdgeInsets.all(20.0),
      mainAxisSpacing: 50.0,
      crossAxisSpacing: 50.0,
      children: _buildGridTileList(12));
}


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
        child: buildGrid(),
      ),
    );
  }
}