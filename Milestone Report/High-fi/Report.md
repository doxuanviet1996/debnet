# Project milestone 4: High-Fi Prototype
Team: DebNet

Members:
1. Viet Do - 20160736 - doxuanviet1996@kaist.ac.kr
2. Anh Le - 20170763 - vietanhle@kaist.ac.kr
3. Van Hoang - 20160738 - vanhoang@kaist.ac.kr
4. Dohyeong Kim - 20160076 - lastnone@kaist.ac.kr

## Project Summary

The debts connection among a group of friends can be quite complex, due to occasions like eating, movies, etc. and one person pays everything and others will repay later. DebNet helps manage this connections by summarizing the total amount of money, memorizing the events and listing the debts. Furthermore, DebNet has unique user profile where statistics (e.g. number of transactions) are showed.
## Instruction

<center> User Profile </center>

<center> <img/ src = "images/profile.jpg"> </center>

<center> Event creation </center>

<center> <img/ src = "images/create_event.jpg"> </center>

<center> A particular event </center>

<center> <img/ src = "images/event.jpg"> </center>

<center> Debts List </center>

<center> <img/ src = "images/debts.jpg"> </center>

## Prototype

The project is built as an mobile app, and unfortunately we can't export the project to a web version. Please download the apk file to your phone and install it to test the prototype. Sorry for the inconvenience.
**Download link:** https://github.com/doxuanviet1996/debnet/blob/master/debnet.apk
*Please let us know if there is any version problem. We have tested it on several phones and it worked fine, however we are not absolutely sure that it will work properly on your phone.*

## Git repository

Link: https://github.com/doxuanviet1996/debnet/

## Libraries and Frameworks

The high-fi prototype was built by using a mobile app SDK called **Flutter**. Flutter provides an easy way to build beautiful native apps by using it high level libraries, consisting of numerous widgets.
Flutter uses Dart language, an object-oriented language similar to Java.
More details about Flutter can be found at https://flutter.io/

## Individual Reflections

1. **Viet Do**
    - **Contribution**: I built the 'fake' database where data are generated, defined database classes that are used in our implementation like 'user', 'event', 'notification', etc. I am also responsible for synchronizing the data into the frontend part, similar to querying to a database, except that data are manipulated and read/write directly. Besides, because I have experience working with Flutter, I helped others in learning the framework and answering questions related to coding details (e.g. when to use what widgets, what widgets would give the visualization that we wanted, etc.).
    - **Difficulties**: Managing data and passing it into front end is not easy, and it is also the most buggy part in implementing the project. Unlike frontend where changes and potential bugs can be seen visually, bugs in database require higher debugging skill and is harder to code. Furthermore, this is my first time building a mobile app, so the difficulties also come from exporting the app. Initially our plan was to upload it to Google Store, however that requires signing and verifying, so in the end we can only export it in to an *apk* file.
    - **Most useful skill learned**: While building the prototype, the most valuable skill I obtained is defining the database for a project. In our project, I have to consider carefully which classes should be build and how can one affects another. Defining a database that is effective, fully-functional, yet simple and easy to understand is not easy. Our project is quite small, so the database is fairly easy for me to organize, however in larger project I believe that it can be a very challenging problem.
2. **Viet Anh Le**
3. **Van Hoang**
4. **Dohyeong Kim**

