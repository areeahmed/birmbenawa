import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'todo_data_model.g.dart';

@HiveType(typeId: 0)
class TODO {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  bool? isChecked;
  TODO({
    this.title,
    this.description,
    this.isChecked,
  });

  TODO copyWith({
    String? title,
    String? Description,
    bool? isChecked,
  }) {
    return TODO(
      title: title ?? this.title,
      description: Description ?? this.description,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  Map<dynamic, dynamic> toMap() {
    final result = <dynamic, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'Description': description});
    result.addAll({'isChecked': isChecked});

    return result;
  }

  factory TODO.fromMap(Map<dynamic, dynamic> map) {
    return TODO(
      title: map['title'] ?? '',
      description: map['Description'] ?? '',
      isChecked: map['isChecked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TODO.fromJson(String source) => TODO.fromMap(json.decode(source));

  @override
  String toString() =>
      'TODO(title: $title, Description: $description, isChecked: $isChecked)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TODO &&
        other.title == title &&
        other.description == description &&
        other.isChecked == isChecked;
  }

  @override
  int get hashCode =>
      title.hashCode ^ description.hashCode ^ isChecked.hashCode;
}
