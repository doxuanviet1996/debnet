import 'package:flutter/material.dart';


class Friends extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildGridTileList(int count) {
      return List<Widget>.generate(
        count,
        (int index) {
          return Stack(
            children: <Widget>[
//              Container(
//                decoration: BoxDecoration(border: Border.all()),
//              ),
              Align(
                alignment: Alignment(0.0, -0.5),
                child: Container(
                  height: 128.0,
                  width: 128.0,
                  child: CircleAvatar(backgroundImage: AssetImage('images/vanh${index+1}.jpg'),),
                ),
              ),
              Align(
                alignment: Alignment(0.0, 1.0),
                child: Text(
                  'Dm vanh',
                  textScaleFactor: 1.0,
                ),
              ),
            ],
          );
        });
//          => Container(child: CircleAvatar(backgroundImage: AssetImage('images/vanh${index+1}.jpg'))));
      }

    Widget buildGrid() {
      return GridView.extent(
          maxCrossAxisExtent: 200.0,
          padding: EdgeInsets.all(10.0),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          children: _buildGridTileList(12));
    }
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