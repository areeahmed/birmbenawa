import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'daily_reminder_card_data.g.dart';

@HiveType(typeId: 0)
class DailyReminderCardData {
  @HiveField(0)
  String title;
  @HiveField(1) // will be shown
  String descriptionOfCard;
  @HiveField(2) // will be shown
  int hour;
  @HiveField(3) // will be shown
  int minute;
  @HiveField(4) // will be shown
  String pmOrAm;
  @HiveField(5)
  int dayOfWeek;
  DailyReminderCardData({
    required this.title,
    required this.descriptionOfCard,
    required this.hour,
    required this.minute,
    required this.pmOrAm,
    required this.dayOfWeek,
  });

  DailyReminderCardData copyWith({
    String? title,
    String? descriptionOfCard,
    int? houre,
    int? minute,
    String? pmOrAm,
    int? dayOfWeek,
  }) {
    return DailyReminderCardData(
      title: title ?? this.title,
      descriptionOfCard: descriptionOfCard ?? this.descriptionOfCard,
      hour: houre ?? this.hour,
      minute: minute ?? this.minute,
      pmOrAm: pmOrAm ?? this.pmOrAm,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    );
  }

  Map<dynamic, dynamic> toMap() {
    final result = <dynamic, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'descriptionOfCard': descriptionOfCard});
    result.addAll({'houre': hour});
    result.addAll({'minute': minute});
    result.addAll({'pmOrAm': pmOrAm});
    result.addAll({'dayOfWeek': dayOfWeek});

    return result;
  }

  factory DailyReminderCardData.fromMap(Map<dynamic, dynamic> map) {
    return DailyReminderCardData(
      title: map['title'] ?? '',
      descriptionOfCard: map['descriptionOfCard'] ?? '',
      hour: map['houre']?.toInt() ?? 0,
      minute: map['minute']?.toInt() ?? 0,
      pmOrAm: map['pmOrAm'] ?? '',
      dayOfWeek: map['dayOfWeek']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyReminderCardData.fromJson(String source) =>
      DailyReminderCardData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DailyReminderCardData(title: $title, descriptionOfCard: $descriptionOfCard, houre: $hour, minute: $minute, pmOrAm: $pmOrAm, dayOfWeek: $dayOfWeek)';
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
        other.dayOfWeek == dayOfWeek;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        descriptionOfCard.hashCode ^
        hour.hashCode ^
        minute.hashCode ^
        pmOrAm.hashCode ^
        dayOfWeek.hashCode;
  }
}
