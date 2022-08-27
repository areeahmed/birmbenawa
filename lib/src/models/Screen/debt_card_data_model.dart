import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'debt_card_data_model.g.dart';

@HiveType(typeId: 0)
class DebtCardDataModel {
  @HiveField(1)
  String nameTookDebt;
  @HiveField(2)
  double debt;
  @HiveField(3)
  String typeOfDebt;

  DebtCardDataModel({
    required this.nameTookDebt,
    required this.debt,
    required this.typeOfDebt,
  });

  DebtCardDataModel copyWith({
    String? nameTookDebt,
    double? debt,
    String? typeOfDebt,
  }) {
    return DebtCardDataModel(
      nameTookDebt: nameTookDebt ?? this.nameTookDebt,
      debt: debt ?? this.debt,
      typeOfDebt: typeOfDebt ?? this.typeOfDebt,
    );
  }

  Map<dynamic, dynamic> toMap() {
    final result = <dynamic, dynamic>{};

    result.addAll({'nameTookDebt': nameTookDebt});
    result.addAll({'debt': debt});
    result.addAll({'typeOfDebt': typeOfDebt});

    return result;
  }

  factory DebtCardDataModel.fromMap(Map<dynamic, dynamic> map) {
    return DebtCardDataModel(
      nameTookDebt: map['nameTookDebt'] ?? '',
      debt: map['debt']?.toDouble() ?? 0.0,
      typeOfDebt: map['typeOfDebt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DebtCardDataModel.fromJson(String source) =>
      DebtCardDataModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DebtCardDataModel(nameTookDebt: $nameTookDebt, debt: $debt, typeOfDebt: $typeOfDebt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DebtCardDataModel &&
        other.nameTookDebt == nameTookDebt &&
        other.debt == debt &&
        other.typeOfDebt == typeOfDebt;
  }

  @override
  int get hashCode =>
      nameTookDebt.hashCode ^ debt.hashCode ^ typeOfDebt.hashCode;
}
