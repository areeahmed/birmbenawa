import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

Future<void> createNotification({
  required int id,
  required String givenTitle,
  required String givenBody,
}) async {
  await AwesomeNotifications().createNotification(
    // the id should be a uniq id
    content: NotificationContent(
      id: id,
      channelKey: 'basic_channel',
      title: '${Emojis.time_watch}: $givenTitle',
      body: givenBody,
      bigPicture: 'assets://assets/notification_reminder_image',
      //TODO check the notification type and find out witch one is will be possible
      notificationLayout: NotificationLayout.Default,
    ),
  );
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(5.remainder(3));
}

class NotificationWeekAndTime {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final String givenTitle;
  final String givenBody;
  NotificationWeekAndTime({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.givenTitle,
    required this.givenBody,
  });
}

Future<void> createSpecificScheduledNotification(
    NotificationWeekAndTime notificationSchedule) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      title: notificationSchedule.givenTitle,
      id: createUniqueId(),
      channelKey: 'scheduled_channel',
      body: notificationSchedule.givenBody,
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE',
        label: 'Mark Done',
      ),
    ],
    schedule: NotificationCalendar(
      year: notificationSchedule.year,
      month: notificationSchedule.month,
      day: notificationSchedule.day,
      hour: notificationSchedule.hour,
      minute: notificationSchedule.minute,
      second: 0,
      millisecond: 0,
      repeats: false,
    ),
  );
}

class NotificationDailyWeekAndTime {
  final int dayOfTheWeek;
  final TimeOfDay timeOfDay;
  final String givenTitle;
  final String givenBody;
  NotificationDailyWeekAndTime({
    required this.dayOfTheWeek,
    required this.timeOfDay,
    required this.givenTitle,
    required this.givenBody,
  });
}

Future<void> createDailyScheduledNotification(
    NotificationDailyWeekAndTime notificationDailySchedule) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      title: notificationDailySchedule.givenTitle,
      id: createUniqueId(),
      channelKey: 'scheduled_channel',
      body: notificationDailySchedule.givenBody,
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE',
        label: 'Mark Done',
      ),
    ],
    schedule: NotificationCalendar(
      weekday: notificationDailySchedule.dayOfTheWeek,
      hour: notificationDailySchedule.timeOfDay.hour,
      minute: notificationDailySchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}
