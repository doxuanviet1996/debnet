import 'package:flutter/material.dart';

UserManager userManager;
EventManager eventManager;

void generateData() {
  userManager = new UserManager();
  eventManager = new EventManager();
  print('Called?');
  UserData viet = new UserData(
    name: "Viet Do",
    profilePicture: AssetImage('images/vanh1.jpg'),
    email: "vietdoxuan1996@gmail.com",
    moneyDue: 10000,
  );
  UserData vanh = new UserData(
    name: "Viet Anh Le",
    profilePicture: AssetImage('images/vanh.jpg'),
    email: "vietanhle0710@gmail.com",
    moneyDue: -5000,
  );
  UserData van = new UserData(
    name: "Van Hoang",
    profilePicture: AssetImage('images/vanh2.jpg'),
    email: "vanhoang.1996@gmail.com",
    moneyDue: 0,
  );
  userManager.add(viet);
  userManager.add(vanh);
  userManager.add(van);
  EventData film = new EventData(
      name: "Detective Pikachu",
      time: DateTime.now(),
      cost: 30000,
      payerID: viet.userID,
      participants: <int>[viet.userID, vanh.userID, van.userID],
  );
  eventManager.add(film);
}

class UserData {
  UserData({
    @required this.name,
    this.profilePicture, // Set default
    @required this.email,
    this.moneyDue = 0,
  }) {
    events = new List<int>();
  }
  int userID;
  String name;
  ImageProvider profilePicture;
  String email;
  int moneyDue;
  List<int> events;
}

class UserManager {
  UserManager() {
    users = new List<UserData>();
  }
  List<UserData> users;
  int userIdCount = 0;
  int currentUser = 0;

  void add(UserData user) {
    print('Add user $user.name');
    user.userID = userIdCount++;
    users.add(user);
  }

  UserData get(int userID) {
    return users[userID];
  }

  UserData getCurrent() {
    return users[currentUser];
  }

  void setCurrent(int userID) {
    currentUser = userID;
  }

  List<DebtData> getDebts() {
    List<DebtData> res;
    UserData user = getCurrent();
    for(int i=0; i<user.events.length; i++) {
      EventData event = eventManager.get(user.events[i]);
      for(int j=0; j<event.debts.length; j++) {
        DebtData debt = event.debts[j];
        if(debt.host == user.userID || debt.client == user.userID)
          res.add(debt);
      }
    }
    return res;
  }
}

class EventData {
  EventData({
    @required this.name,
    @required this.time,
    @required this.cost,
    @required this.payerID,
    @required this.participants,
  }) {
    debts = new List<DebtData>();
  }
  int eventID;
  String name;
  DateTime time;
  int cost;
  int payerID;
  List<int> participants;
  List<DebtData> debts;
}

class EventManager {
  EventManager() {
    events = new List<EventData>();
  }
  List<EventData> events;
  int eventIdCount = 0;
  int currentEvent = 0;
  void add(EventData event) {
    event.eventID = eventIdCount++;
    int debtAmount = event.cost ~/ event.participants.length;
    for(int i=0; i<event.participants.length; i++) {
      if(i != event.payerID) {
        event.debts.add(DebtData(
          eventID: event.eventID,
          host: event.payerID,
          client: event.participants[i],
          amount: debtAmount,
          done: 0,
        ));
        userManager.get(event.payerID).moneyDue += debtAmount;
        userManager.get(event.participants[i]).moneyDue -= debtAmount;
      }
    }
    events.add(event);
  }

  EventData get(int eventID) {
    return events[eventID];
  }

  EventData getCurrent() {
    return events[currentEvent];
  }
}

class DebtData {
  DebtData({
    @required this.eventID,
    @required this.host,
    @required this.client,
    @required this.amount,
    this.done = 0,
  }) {}
  int eventID;
  int host;
  int client;
  int amount;
  // Three status: not done, pending (waiting accept), done, correspond to 0, 1, 2.
  int done;
}