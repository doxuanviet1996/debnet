import 'package:flutter/material.dart';


void generateData() {
  UserData viet = new UserData(name: "Viet Do", email: "vietdoxuan1996@gmail.com");
  UserData vanh = new UserData(name: "Viet Anh Le", email: "vietanhle0710@gmail.com");
  UserData van = new UserData(name: "Van Hoang", email: "vanhoang.1996@gmail.com");
  UserManager.add(viet);
  UserManager.add(vanh);
  UserManager.add(van);
}

class UserData {
  UserData({
    @required this.name,
    this.profilePicture, // Set default
    @required this.email,
  }) {}
  int userID;
  String name;
  ImageProvider profilePicture;
  String email;
  List<int> events;
}

class UserManager {
  static List<UserData> users;
  static int userIdCount = 0;
  static int currentUser = 0;

  static void add(UserData user) {
    user.userID = userIdCount++;
    users.add(user);
  }

  static UserData get(int userID) {
    return users[userID];
  }

  static UserData getCurrent() {
    return users[currentUser];
  }

  static List<DebtData> getDebts() {
    List<DebtData> res;
    UserData user = getCurrent();
    for(int i=0; i<user.events.length; i++) {
      EventData event = EventManager.get(user.events[i]);
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
  }) {}
  int eventID;
  String name;
  DateTime time;
  int cost;
  int payerID;
  List<int> participants;
  List<DebtData> debts;
}

class EventManager {
  static List<EventData> events;
  static int eventIdCount = 0;
  static int currentEvent = 0;
  static void add(EventData event) {
    event.eventID = eventIdCount++;
    for(int i=0; i<event.participants.length; i++) {
      if(i != event.payerID)
        event.debts.add(DebtData(
          eventID: event.eventID,
          host: event.payerID,
          client: event.participants[i],
          amount: event.cost ~/ event.participants.length,
          done: 0,
        ));
    }
    events.add(event);
  }

  static EventData get(int eventID) {
    return events[eventID];
  }

  static EventData getCurrent() {
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