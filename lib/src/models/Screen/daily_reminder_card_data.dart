import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'daily_reminder_card_data.g.dart';

@HiveType(typeId: 0)
class DailyReminderCardData {
  @HiveField(0)
  String title;
  @HiveField(1)
  String descriptionOfCard;
  @HiveField(2)
  int hour;
  @HiveField(3)
  int minute;
  @HiveField(4)
  String pmOrAm;
  @HiveField(5)
  int dayOfWeek;
  @HiveField(6)
  int? notificationId;
  DailyReminderCardData({
    required this.title,
    required this.descriptionOfCard,
    required this.hour,
    required this.minute,
    required this.pmOrAm,
    required this.dayOfWeek,
    this.notificationId,
  });

  DailyReminderCardData copyWith({
    String? title,
    String? descriptionOfCard,
    int? hour,
    int? minute,
    String? pmOrAm,
    int? dayOfWeek,
    int? notificationId,
  }) {
    return DailyReminderCardData(
      title: title ?? this.title,
      descriptionOfCard: descriptionOfCard ?? this.descriptionOfCard,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      pmOrAm: pmOrAm ?? this.pmOrAm,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      notificationId: notificationId ?? this.notificationId,
    );
  }

  Map<dynamic, dynamic> toMap() {
    final result = <dynamic, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'descriptionOfCard': descriptionOfCard});
    result.addAll({'hour': hour});
    result.addAll({'minute': minute});
    result.addAll({'pmOrAm': pmOrAm});
    result.addAll({'dayOfWeek': dayOfWeek});
    if (notificationId != null) {
      result.addAll({'notificationId': notificationId});
    }

    return result;
  }

  factory DailyReminderCardData.fromMap(Map<dynamic, dynamic> map) {
    return DailyReminderCardData(
      title: map['title'] ?? '',
      descriptionOfCard: map['descriptionOfCard'] ?? '',
      hour: map['hour']?.toInt() ?? 0,
      minute: map['minute']?.toInt() ?? 0,
      pmOrAm: map['pmOrAm'] ?? '',
      dayOfWeek: map['dayOfWeek']?.toInt() ?? 0,
      notificationId: map['notificationId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyReminderCardData.fromJson(String source) =>
      DailyReminderCardData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DailyReminderCardData(title: $title, descriptionOfCard: $descriptionOfCard, hour: $hour, minute: $minute, pmOrAm: $pmOrAm, dayOfWeek: $dayOfWeek, notificationId: $notificationId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DailyReminderCardData &&
        other.title == title &&
        other.descriptionOfCard == descriptionOfCard &&
        other.hour == hour &&
        other.minute == minute &&
        other.pmOrAm == pmOrAm &&
        other.dayOfWeek == dayOfWeek &&
        other.notificationId == notificationId;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        descriptionOfCard.hashCode ^
        hour.hashCode ^
        minute.hashCode ^
        pmOrAm.hashCode ^
        dayOfWeek.hashCode ^
        notificationId.hashCode;
  }
}
