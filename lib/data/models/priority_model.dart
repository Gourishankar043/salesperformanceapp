import '../../domain/entities/priority.dart';

class PriorityModel extends Priority {
  const PriorityModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory PriorityModel.fromJson(Map<String, dynamic> json) {
    return PriorityModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}