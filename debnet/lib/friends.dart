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
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/friends/profile');
            },
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.0, -0.5),
                  child: Container(
                    height: 128.0,
                    width: 128.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff7c94b6),
                      boxShadow: [new BoxShadow(
                        color: Colors.blue,
                        blurRadius: 8.0,
                      ),],
                      image: DecorationImage(
                        image: ExactAssetImage('images/vanh${index+1}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // CircleAvatar(backgroundImage: AssetImage('images/vanh${index+1}.jpg'),),
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
            ),
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

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>new _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, -0.5),
            child: Container(
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff7c94b6),
                boxShadow: [new BoxShadow(
                  color: Colors.blue,
                  blurRadius: 20.0,
                ),],
                image: DecorationImage(
                  image: ExactAssetImage('images/vanh1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.5),
            child: Text(
              'Dm vanh',
              textScaleFactor: 2.0,
//              style: TextStyle(color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.8),
            child: ListTile (
              leading: Icon(IconData(0xe065, fontFamily: 'MaterialIcons'), color: Colors.blue),
              title: Text('Number of transactions'),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: ListTile (
              leading: Icon(IconData(0xe614, fontFamily: 'MaterialIcons'), color: Colors.blue),
              title: Text('Number of joined events'),
            ),
          ),
        ],
      ),
    );
  }
}