import 'package:flutter/material.dart';

import 'database.dart';

class Friends extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    for(int i=0; i<userManager.userIdCount; i++) {
      children.add(GestureDetector(
        onTap: () {
          userManager.currentViewedUser = i;
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
                    image: userManager.get(i).profilePicture,
                    fit: BoxFit.cover,
                  ),
                ),
                // CircleAvatar(backgroundImage: AssetImage('images/vanh${index+1}.jpg'),),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 1.0),
              child: Text(
                userManager.get(i).name,
                textScaleFactor: 1.0,
              ),
            ),
          ],
        ),
      ));
    }

    Widget buildGrid() {
      return GridView.extent(
          maxCrossAxisExtent: 200.0,
          padding: EdgeInsets.all(10.0),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          children: children);
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text('List of Users'),
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
    UserData user = userManager.get(userManager.currentViewedUser);
    List<DebtData> debts = userManager.getDebts(userManager.currentViewedUser);
    int paid = 0, total = 0;

    for(int i=0; i<debts.length; i++) {
      if(debts[i].client == user.userID) {
        if(debts[i].done == 1) paid++;
        total++;
      }
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, -0.8),
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
                  image: user.profilePicture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.4),
            child: Text(
              user.name,
              textScaleFactor: 2.0,
//              style: TextStyle(color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.5),
            child: Text(
              user.email,
              textScaleFactor: 1.0,
//              style: TextStyle(color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.8),
            child: ListTile (
              leading: Icon(IconData(0xe065, fontFamily: 'MaterialIcons'), color: Colors.blue),
              title: Text('Number of transactions'),
              trailing: Text('${paid} done / ${total} total'),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: ListTile (
              leading: Icon(IconData(0xe614, fontFamily: 'MaterialIcons'), color: Colors.blue),
              title: Text('Number of joined events'),
              trailing: Text('${user.eventHosted()} hosted / ${user.events.length} total'),
            ),
          ),
        ],
      ),
    );
  }
}