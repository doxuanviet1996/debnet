# DebNet
The codes are all in `debnet/lib/` :
- `debnet/lib/main.dart`: The home page, also define routing table.
- `debnet/lib/database.dart`: The 'fake' database where all datas are generated and managed.
- `debnet/lib/debts`: Showing list of debts.
- `debnet/lib/events.dart`: Show the 'List of Events' page and 'Event Creation' page.
- `debnet/lib/friends.dart`: Show the 'List of User' page and 'User Profile' page.
- `debnet/lib/notification.dart`: Show the 'Notification' page.
- `debnet/lib/payments.dart`: Show the 'Payment History' page.

The asset images that are used are all in `debnet/images`.

### Note
- Since the data are fake and there are no database, everytime you restart the app, everything will be reset.
- Because the prototype is for testing purpose only, we do not allow adding or modifying user accounts. Try testing the app by using any account, or use the 'Default User'.
- Integrity are not checked, so there is no need to test that aspect (for example, typing words in field that should be number).

**The app is exported to `debnet.apk`. Please download and install it manually to test our prototype. Thank you!**
