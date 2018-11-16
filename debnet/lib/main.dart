import 'package:flutter/material.dart';

import 'events.dart';
import 'debts.dart';
import 'payments.dart';
import 'friends.dart';
import 'notification.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      "/events" : (BuildContext context) => Events(),
      "/debts" : (BuildContext context) => Debts(),
      "/payment_history" : (BuildContext context) => PaymentsHistory(),
      "/friends" : (BuildContext context) => Friends(),
      "/create" : (BuildContext context) => EventCreation(),
      "/notification" : (BuildContext context) => Notifications(),
    };
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'DebNet',
      color: Colors.grey,
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('DebNet'),
        actions: <Widget> [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(IconData(0xe7f5, fontFamily: 'MaterialIcons'), color: Colors.white),
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
                backgroundImage: AssetImage('images/vanh.jpg'),
              ),
              accountName: Text('Le Viet Anh'),
              accountEmail: Text('vanhle@gmail.com'),
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
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue,
              width: 5.0,
            ),
          ),
          child: Center(
            child: Text(
              '100,000 won',
              style: TextStyle(
                color: Colors.green,
              ),
              textScaleFactor: 2.0,
            ),
          ),
        ),
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
