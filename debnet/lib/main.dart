import 'package:flutter/material.dart';

import 'events.dart';
import 'debts.dart';
import 'payments.dart';
import 'friends.dart';
import 'notification.dart';
import 'database.dart';

void main() {
  generateData();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      "/events" : (BuildContext context) => Events(),
      "/debts" : (BuildContext context) => Debts(),
      "/payment_history" : (BuildContext context) => PaymentsHistory(),
      "/friends" : (BuildContext context) => Friends(),
      "/create" : (BuildContext context) => EventCreation(),
      "/notification" : (BuildContext context) => Notifications(),
      "/events/event" : (BuildContext context) => Event(),
      "/friends/profile" : (BuildContext context) => Profile(),
    };
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'DebNet',
      color: Colors.grey,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _buildRoutes(),
      home: new MyHomePage(title: 'DebNet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> getOtherAvatars() {
    List<Widget> res = <Widget>[];
    for(int i=0; i<userManager.userIdCount; i++)
      if(i != userManager.currentUser && res.length < 3)
        res.add(GestureDetector(
          onTap: () {
            setState(() {
              userManager.currentUser = i;
            });
          },
          child: CircleAvatar(
            backgroundImage: userManager.get(i).profilePicture,
          ),
        ));
    return res;
  }

  @override
  Widget build(BuildContext context) {
    UserData currentUser = userManager.getCurrent();
    return Scaffold(
      appBar: AppBar(
        title: Text('DebNet'),
        actions: <Widget> [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: (currentUser.newNoti > 0)
                ? Icon(Icons.notification_important, color: Colors.red)
                : Icon(IconData(0xe7f5, fontFamily: 'MaterialIcons'), color: Colors.white),
              iconSize: 35.0,
              tooltip: 'Notification',
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              }
            ),
          ),  
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: currentUser.profilePicture,
              ),
              accountName: Text(currentUser.name),
              accountEmail: Text(currentUser.email),
              otherAccountsPictures: getOtherAvatars(),
            ),
            ListTile(
              leading: Icon(IconData(0xe878, fontFamily: 'MaterialIcons'), color: Colors.blue,),
              title: Text('List of Events'),
              onTap: () {
                Navigator.pushNamed(context, '/events');
              },
            ),
            ListTile(
              leading: Icon(IconData(0xe85d, fontFamily: 'MaterialIcons'), color: Colors.blue,),
              title: Text('List of Debts'),
              onTap: () {
                Navigator.pushNamed(context, '/debts');
              },
            ),
            ListTile(
              leading: Icon(IconData(0xe889, fontFamily: 'MaterialIcons'), color: Colors.blue,),
              title: Text('Payment History'),
              onTap: () {
                Navigator.pushNamed(context, '/payment_history');
              },
            ),
            ListTile(
              leading: Icon(IconData(0xe7ef, fontFamily: 'MaterialIcons'), color: Colors.blue,),
              title: Text('Friend List'),
              onTap: () {
                Navigator.pushNamed(context, '/friends');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, 0.65),
            child: Text(
              'MONEY DUE',
              textScaleFactor: 3.0,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.35),
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 13.0,

                ),
                boxShadow: [new BoxShadow(
                  color: Colors.blue,
                  blurRadius: 40.0,
                ),],
              ),
              child: Center(
                child: Text(
                  currentUser.moneyDue.toString() + " won",
                  style: TextStyle(
                    color: currentUser.moneyDue >= 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                  textScaleFactor: 3.0,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        tooltip: 'Create an event',
        child: new Icon(Icons.add),
      ),
    );
  }
}
