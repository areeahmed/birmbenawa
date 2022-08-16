import 'dart:convert';

//* this model is for the data of the cards, you will use provider for the cards
class ReminderCardData {
  String title;
  String descriptionOfCard;
  int houre;
  int minute;
  String pmOrAm;
  ReminderCardData(
    this.title,
    this.descriptionOfCard,
    this.houre,
    this.minute,
    this.pmOrAm,
  );

  ReminderCardData copyWith({
    String? title,
    String? descriptionOfCard,
    int? houre,
    int? minute,
    String? pmOrAm,
  }) {
    return ReminderCardData(
      title ?? this.title,
      descriptionOfCard ?? this.descriptionOfCard,
      houre ?? this.houre,
      minute ?? this.minute,
      pmOrAm ?? this.pmOrAm,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'descriptionOfCard': descriptionOfCard});
    result.addAll({'houre': houre});
    result.addAll({'minute': minute});
    result.addAll({'pmOrAm': pmOrAm});

    return result;
  }

  factory ReminderCardData.fromMap(Map<String, dynamic> map) {
    return ReminderCardData(
      map['title'] ?? '',
      map['descriptionOfCard'] ?? '',
      map['houre']?.toInt() ?? 0,
      map['minute']?.toInt() ?? 0,
      map['pmOrAm'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReminderCardData.fromJson(String source) =>
      ReminderCardData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReminderCardData(title: $title, descriptionOfCard: $descriptionOfCard, houre: $houre, minute: $minute, pmOrAm: $pmOrAm)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReminderCardData &&
        other.title == title &&
        other.descriptionOfCard == descriptionOfCard &&
        other.houre == houre &&
        other.minute == minute &&
        other.pmOrAm == pmOrAm;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        descriptionOfCard.hashCode ^
        houre.hashCode ^
        minute.hashCode ^
        pmOrAm.hashCode;
  }
}
