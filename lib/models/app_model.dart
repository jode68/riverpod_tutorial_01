import 'dart:convert';

class AppModel {
  final String title;
  final String description;
  bool isDone = false;

  AppModel({
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory AppModel.fromMap(Map<String, dynamic> map) {
    return AppModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppModel.fromJson(String source) =>
      AppModel.fromMap(json.decode(source));

  AppModel copyWith({
    String? title,
    String? description,
    bool? isDone,
  }) {
    return AppModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
