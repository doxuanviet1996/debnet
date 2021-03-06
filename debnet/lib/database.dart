import 'package:flutter/material.dart';

UserManager userManager;
EventManager eventManager;

void generateData() {
  userManager = new UserManager();
  eventManager = new EventManager();
  UserData viet = new UserData(
    name: "Viet Do",
    profilePicture: AssetImage('images/viet.jpg'),
    email: "vietdoxuan1996@gmail.com",
    moneyDue: 0,
  );
  UserData vanh = new UserData(
    name: "Viet Anh Le",
    profilePicture: AssetImage('images/vanh.jpg'),
    email: "vietanhle0710@gmail.com",
    moneyDue: 0,
  );
  UserData van = new UserData(
    name: "Van Hoang",
    profilePicture: AssetImage('images/van.jpg'),
    email: "vanhoang.1996@gmail.com",
    moneyDue: 0,
  );
  UserData anonymous = new UserData(
    name: "Default User",
    profilePicture: AssetImage('images/default.png'),
    email: "defaultuser@gmail.com",
    moneyDue: 0,
  );
  UserData dohyeong = new UserData(
    name: "Dohyeong",
    profilePicture: AssetImage('images/dohyeong.png'),
    email: "dohyeong@gmail.com",
    moneyDue: 0,
  );
  UserData junvu1 = new UserData(
    name: "Vu Phuong Anh",
    profilePicture: AssetImage('images/junvu.jpg'),
    email: "vuphuonganh@gmail.com",
    moneyDue: 0,
  );
  UserData juhokim = new UserData(
    name: "Juho Kim",
    profilePicture: AssetImage('images/juho.jpg'),
    email: "juhokim@gmail.com",
    moneyDue: 0,
  );
  userManager.add(viet);
  userManager.add(vanh);
  userManager.add(van);
  userManager.add(anonymous);
  userManager.add(dohyeong);
  userManager.add(junvu1);
  userManager.add(juhokim);
}

class UserData {
  UserData({
    @required this.name,
    this.profilePicture, // Set default
    @required this.email,
    this.moneyDue = 0,
  }) {
    events = new List<int>();
    notifications = new List<Noti>();
    newNoti = 0;
  }
  int userID;
  String name;
  ImageProvider profilePicture;
  String email;
  int moneyDue;
  int newNoti;
  List<int> events;
  List<Noti> notifications;
  void addNoti(Noti noti) {
    newNoti++;
    notifications.add(noti);
  }
  ListTile asListTile() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: profilePicture,
      ),
      title: Text(name),
      subtitle: Text(email),
    );
  }
  int eventHosted() {
    int res = 0;
    for(int i=0; i<events.length; i++)
      if(eventManager.get(events[i]).payerID == userID) res++;
    return res;
  }
}

class UserManager {
  UserManager() {
    users = new List<UserData>();
  }
  List<UserData> users;
  int userIdCount = 0;
  int currentUser = 0;
  int currentViewedUser = 0;

  void add(UserData user) {
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

  List<DebtData> getDebts([int userID]) {
    List<DebtData> res = <DebtData>[];
    UserData user = userID == null ? userManager.getCurrent() : userManager.get(userID);
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
    this.icon = const Icon(Icons.theaters, color: Colors.blue,),
    @required this.participants,
  }) {
    debts = new List<DebtData>();
  }
  int eventID;
  String name;
  DateTime time;
  int cost;
  int payerID;
  Icon icon;
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
    print("Add event");
    print(event.participants);
    print(event.payerID);
    for(int i=0; i<event.participants.length; i++) {
      userManager.get(event.participants[i]).events.add(event.eventID);
      if(event.participants[i] != event.payerID) {
        event.debts.add(DebtData(
          eventID: event.eventID,
          host: event.payerID,
          client: event.participants[i],
          amount: debtAmount,
          done: 0,
        ));
        userManager.get(event.payerID).moneyDue += debtAmount;
        userManager.get(event.participants[i]).moneyDue -= debtAmount;
        userManager.get(event.participants[i]).addNoti(Noti(
          eventID: event.eventID,
          content: '${userManager.get(event.payerID).name} created an event with you',
          subContent: '${event.name} - ${event.time.year}/${event.time.month}/${event.time.day}',
          icon: event.icon,
        ));
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
  void setCurrent(int eventID) {
    currentEvent = eventID;
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
  int done;
  void makePayment() {
    EventData event = eventManager.get(eventID);
    userManager.get(host).moneyDue -= amount;
    userManager.get(client).moneyDue += amount;
    done = 1;
    userManager.get(host).addNoti(Noti(
      eventID: event.eventID,
      content: '${userManager.get(client).name} paid you ${amount} won.',
      subContent: '${event.name} - ${event.time.year}/${event.time.month}/${event.time.day}',
    ));
  }
}

class Noti {
  Noti({
    @required this.eventID,
    @required this.content,
    @required this.subContent,
    this.icon = const Icon(Icons.attach_money),
    this.viewed = false,
  }){}
  int eventID;
  String content;
  String subContent;
  Icon icon;
  bool viewed;
}