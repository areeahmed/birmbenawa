import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'debt_card_data_model.g.dart';

@HiveType(typeId: 0)
class DebtCardDataModel {
  @HiveField(1)
  String nameTookDebt;
  @HiveField(2)
  int debt;
  @HiveField(3)
  String typeOfDebt;
  @HiveField(4)
  int year;
  @HiveField(5)
  int month;
  @HiveField(6)
  int day;
  @HiveField(7)
  String typeOfDebtMoney;

  DebtCardDataModel({
    required this.nameTookDebt,
    required this.debt,
    required this.typeOfDebt,
    required this.year,
    required this.month,
    required this.day,
    required this.typeOfDebtMoney,
  });

  DebtCardDataModel copyWith({
    String? nameTookDebt,
    int? debt,
    String? typeOfDebt,
    int? year,
    int? month,
    int? day,
    String? typeOfDebtMoney,
  }) {
    return DebtCardDataModel(
      nameTookDebt: nameTookDebt ?? this.nameTookDebt,
      debt: debt ?? this.debt,
      typeOfDebt: typeOfDebt ?? this.typeOfDebt,
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
      typeOfDebtMoney: typeOfDebtMoney ?? this.typeOfDebtMoney,
    );
  }

  Map<dynamic, dynamic> toMap() {
    final result = <dynamic, dynamic>{};

    result.addAll({'nameTookDebt': nameTookDebt});
    result.addAll({'debt': debt});
    result.addAll({'typeOfDebt': typeOfDebt});
    result.addAll({'year': year});
    result.addAll({'month': month});
    result.addAll({'day': day});
    result.addAll({'typeOfDebtMoney': typeOfDebtMoney});

    return result;
  }

  factory DebtCardDataModel.fromMap(Map<dynamic, dynamic> map) {
    return DebtCardDataModel(
      nameTookDebt: map['nameTookDebt'] ?? '',
      debt: map['debt']?.toInt() ?? 0,
      typeOfDebt: map['typeOfDebt'] ?? '',
      year: map['year']?.toInt() ?? 0,
      month: map['month']?.toInt() ?? 0,
      day: map['day']?.toInt() ?? 0,
      typeOfDebtMoney: map['typeOfDebtMoney'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DebtCardDataModel.fromJson(String source) =>
      DebtCardDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DebtCardDataModel(nameTookDebt: $nameTookDebt, debt: $debt, typeOfDebt: $typeOfDebt, year: $year, month: $month, day: $day, typeOfDebtMoney: $typeOfDebtMoney)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DebtCardDataModel &&
        other.nameTookDebt == nameTookDebt &&
        other.debt == debt &&
        other.typeOfDebt == typeOfDebt &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.typeOfDebtMoney == typeOfDebtMoney;
  }

  @override
  int get hashCode {
    return nameTookDebt.hashCode ^
        debt.hashCode ^
        typeOfDebt.hashCode ^
        year.hashCode ^
        month.hashCode ^
        day.hashCode ^
        typeOfDebtMoney.hashCode;
  }
}
