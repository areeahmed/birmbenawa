import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'reminder_card_data.g.dart';

//* this model is for the data of the cards, you will use provider for the cards
@HiveType(typeId: 0)
class ReminderCardData {
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
  bool isChecked; // will be shown
  @HiveField(6)
  int year;
  @HiveField(7)
  int month;
  @HiveField(8)
  int day;
  @HiveField(9)
  int? notificationId;
  ReminderCardData(
    this.title,
    this.descriptionOfCard,
    this.hour,
    this.minute,
    this.pmOrAm,
    this.isChecked,
    this.year,
    this.month,
    this.day,
    this.notificationId,
  );

  ReminderCardData copyWith({
    String? title,
    String? descriptionOfCard,
    int? hour,
    int? minute,
    String? pmOrAm,
    bool? isChecked,
    int? year,
    int? month,
    int? day,
    int? notificationId,
  }) {
    return ReminderCardData(
      title ?? this.title,
      descriptionOfCard ?? this.descriptionOfCard,
      hour ?? this.hour,
      minute ?? this.minute,
      pmOrAm ?? this.pmOrAm,
      isChecked ?? this.isChecked,
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      notificationId ?? this.notificationId,
    );
  }

  Map<dynamic, dynamic> toMap() {
    final result = <dynamic, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'descriptionOfCard': descriptionOfCard});
    result.addAll({'hour': hour});
    result.addAll({'minute': minute});
    result.addAll({'pmOrAm': pmOrAm});
    result.addAll({'isChecked': isChecked});
    result.addAll({'year': year});
    result.addAll({'month': month});
    result.addAll({'day': day});
    if (notificationId != null) {
      result.addAll({'notificationId': notificationId});
    }

    return result;
  }

  factory ReminderCardData.fromMap(Map<dynamic, dynamic> map) {
    return ReminderCardData(
      map['title'] ?? '',
      map['descriptionOfCard'] ?? '',
      map['hour']?.toInt() ?? 0,
      map['minute']?.toInt() ?? 0,
      map['pmOrAm'] ?? '',
      map['isChecked'] ?? false,
      map['year']?.toInt() ?? 0,
      map['month']?.toInt() ?? 0,
      map['day']?.toInt() ?? 0,
      map['notificationId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReminderCardData.fromJson(String source) =>
      ReminderCardData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReminderCardData(title: $title, descriptionOfCard: $descriptionOfCard, hour: $hour, minute: $minute, pmOrAm: $pmOrAm, isChecked: $isChecked, year: $year, month: $month, day: $day, notificationId: $notificationId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReminderCardData &&
        other.title == title &&
        other.descriptionOfCard == descriptionOfCard &&
        other.hour == hour &&
        other.minute == minute &&
        other.pmOrAm == pmOrAm &&
        other.isChecked == isChecked &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.notificationId == notificationId;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        descriptionOfCard.hashCode ^
        hour.hashCode ^
        minute.hashCode ^
        pmOrAm.hashCode ^
        isChecked.hashCode ^
        year.hashCode ^
        month.hashCode ^
        day.hashCode ^
        notificationId.hashCode;
  }
}
