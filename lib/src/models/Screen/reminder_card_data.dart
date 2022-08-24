import 'dart:convert';

import 'package:flutter/material.dart';
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
  int houre;
  @HiveField(3) // will be shown
  int minute;
  @HiveField(4) // will be shown
  String pmOrAm;
  @HiveField(5)
  bool isChecked; // will be shown
  // bool? sat;
  // bool? sun;
  // bool? mon;
  // bool? tue;
  // bool? thr;
  // bool? wed;
  // bool? fri;
  ReminderCardData(
    this.title,
    this.descriptionOfCard,
    this.houre,
    this.minute,
    this.pmOrAm,
    this.isChecked,
  );

  ReminderCardData copyWith({
    String? title,
    String? descriptionOfCard,
    int? houre,
    int? minute,
    String? pmOrAm,
    bool? isChecked,
  }) {
    return ReminderCardData(
      title ?? this.title,
      descriptionOfCard ?? this.descriptionOfCard,
      houre ?? this.houre,
      minute ?? this.minute,
      pmOrAm ?? this.pmOrAm,
      isChecked ?? this.isChecked,
    );
  }

  Map<dynamic, dynamic> toMap() {
    final result = <dynamic, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'descriptionOfCard': descriptionOfCard});
    result.addAll({'houre': houre});
    result.addAll({'minute': minute});
    result.addAll({'pmOrAm': pmOrAm});
    result.addAll({'isChecked': isChecked});

    return result;
  }

  factory ReminderCardData.fromMap(Map<dynamic, dynamic> map) {
    return ReminderCardData(
      map['title'] ?? '',
      map['descriptionOfCard'] ?? '',
      map['houre']?.toInt() ?? 0,
      map['minute']?.toInt() ?? 0,
      map['pmOrAm'] ?? '',
      map['isChecked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReminderCardData.fromJson(String source) =>
      ReminderCardData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReminderCardData(title: $title, descriptionOfCard: $descriptionOfCard, houre: $houre, minute: $minute, pmOrAm: $pmOrAm, isChecked: $isChecked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReminderCardData &&
        other.title == title &&
        other.descriptionOfCard == descriptionOfCard &&
        other.houre == houre &&
        other.minute == minute &&
        other.pmOrAm == pmOrAm &&
        other.isChecked == isChecked;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        descriptionOfCard.hashCode ^
        houre.hashCode ^
        minute.hashCode ^
        pmOrAm.hashCode ^
        isChecked.hashCode;
  }
}
