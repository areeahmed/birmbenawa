import 'dart:convert';

import 'package:flutter/widgets.dart';

class DailyReminderCardData {
  String title; // will be shown
  String descriptionOfCard; // will be shown
  int houre; // will be shown
  int minute; // will be shown
  String pmOrAm; // will be shown
  IconData? icon;
  Color color;
  // Color color;
  bool? sat;
  bool? sun;
  bool? mon;
  bool? tue;
  bool? thr;
  bool? wed;
  bool? fri;
  DailyReminderCardData({
    required this.title,
    required this.descriptionOfCard,
    required this.houre,
    required this.minute,
    required this.pmOrAm,
    this.icon,
    required this.color,
    this.sat,
    this.sun,
    this.mon,
    this.tue,
    this.thr,
    this.wed,
    this.fri,
  });

  DailyReminderCardData copyWith({
    String? title,
    String? descriptionOfCard,
    int? houre,
    int? minute,
    String? pmOrAm,
    IconData? icon,
    Color? color,
    bool? sat,
    bool? sun,
    bool? mon,
    bool? tue,
    bool? thr,
    bool? wed,
    bool? fri,
  }) {
    return DailyReminderCardData(
      title: title ?? this.title,
      descriptionOfCard: descriptionOfCard ?? this.descriptionOfCard,
      houre: houre ?? this.houre,
      minute: minute ?? this.minute,
      pmOrAm: pmOrAm ?? this.pmOrAm,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      sat: sat ?? this.sat,
      sun: sun ?? this.sun,
      mon: mon ?? this.mon,
      tue: tue ?? this.tue,
      thr: thr ?? this.thr,
      wed: wed ?? this.wed,
      fri: fri ?? this.fri,
    );
  }

  Map<dynamic, dynamic> toMap() {
    final result = <dynamic, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'descriptionOfCard': descriptionOfCard});
    result.addAll({'houre': houre});
    result.addAll({'minute': minute});
    result.addAll({'pmOrAm': pmOrAm});
    if (icon != null) {
      result.addAll({'icon': icon!.codePoint});
    }
    result.addAll({'color': color.value});
    if (sat != null) {
      result.addAll({'sat': sat});
    }
    if (sun != null) {
      result.addAll({'sun': sun});
    }
    if (mon != null) {
      result.addAll({'mon': mon});
    }
    if (tue != null) {
      result.addAll({'tue': tue});
    }
    if (thr != null) {
      result.addAll({'thr': thr});
    }
    if (wed != null) {
      result.addAll({'wed': wed});
    }
    if (fri != null) {
      result.addAll({'fri': fri});
    }

    return result;
  }

  factory DailyReminderCardData.fromMap(Map<dynamic, dynamic> map) {
    return DailyReminderCardData(
      title: map['title'] ?? '',
      descriptionOfCard: map['descriptionOfCard'] ?? '',
      houre: map['houre']?.toInt() ?? 0,
      minute: map['minute']?.toInt() ?? 0,
      pmOrAm: map['pmOrAm'] ?? '',
      icon: map['icon'] != null
          ? IconData(map['icon'], fontFamily: 'MaterialIcons')
          : null,
      color: Color(map['color']),
      sat: map['sat'],
      sun: map['sun'],
      mon: map['mon'],
      tue: map['tue'],
      thr: map['thr'],
      wed: map['wed'],
      fri: map['fri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyReminderCardData.fromJson(String source) =>
      DailyReminderCardData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DailyReminderCardData(title: $title, descriptionOfCard: $descriptionOfCard, houre: $houre, minute: $minute, pmOrAm: $pmOrAm, icon: $icon, color: $color, sat: $sat, sun: $sun, mon: $mon, tue: $tue, thr: $thr, wed: $wed, fri: $fri)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DailyReminderCardData &&
        other.title == title &&
        other.descriptionOfCard == descriptionOfCard &&
        other.houre == houre &&
        other.minute == minute &&
        other.pmOrAm == pmOrAm &&
        other.icon == icon &&
        other.color == color &&
        other.sat == sat &&
        other.sun == sun &&
        other.mon == mon &&
        other.tue == tue &&
        other.thr == thr &&
        other.wed == wed &&
        other.fri == fri;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        descriptionOfCard.hashCode ^
        houre.hashCode ^
        minute.hashCode ^
        pmOrAm.hashCode ^
        icon.hashCode ^
        color.hashCode ^
        sat.hashCode ^
        sun.hashCode ^
        mon.hashCode ^
        tue.hashCode ^
        thr.hashCode ^
        wed.hashCode ^
        fri.hashCode;
  }
}
