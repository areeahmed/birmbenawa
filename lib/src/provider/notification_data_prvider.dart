import 'package:flutter/cupertino.dart';

class NotificationProvider extends ChangeNotifier {
  int notificationId = 0;

  changedNotificationId({required int notificationID}) {
    notificationId = notificationID;
  }
}
