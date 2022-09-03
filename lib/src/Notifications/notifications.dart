import 'package:awesome_notifications/awesome_notifications.dart';

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
      notificationLayout: NotificationLayout.Default,
    ),
  );
}

class NotificationWeekAndTime {
  final int? id;
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final String givenTitle;
  final String givenBody;
  NotificationWeekAndTime({
    this.id,
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
      id: notificationSchedule.id!,
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

class NotificationWeekAndTimeRepeated {
  final int? id;
  final int dayOfTheWeek;
  final int hour;
  final int minute;
  final String givenTitle;
  final String givenBody;

  NotificationWeekAndTimeRepeated({
    this.id,
    required this.dayOfTheWeek,
    required this.hour,
    required this.minute,
    required this.givenTitle,
    required this.givenBody,
  });
}

Future<void> createDailyScheduledNotification(
    NotificationWeekAndTimeRepeated notificationWeekAndTimeRepeated) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      title: notificationWeekAndTimeRepeated.givenTitle,
      id: notificationWeekAndTimeRepeated.id!,
      channelKey: 'daily_scheduled_channel',
      body: notificationWeekAndTimeRepeated.givenBody,
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE',
        label: 'Mark Done',
      ),
    ],
    schedule: NotificationCalendar(
      weekday: notificationWeekAndTimeRepeated.dayOfTheWeek,
      hour: notificationWeekAndTimeRepeated.hour,
      minute: notificationWeekAndTimeRepeated.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

// to cancel the specific notification
Future<void> cancelNotification({required int id}) async {
  await AwesomeNotifications().cancel(id);
}

Future<void> cancelAllNotification() async {
  await AwesomeNotifications().cancelAll();
}
