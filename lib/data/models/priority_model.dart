import '../../domain/entities/priority.dart';

class PriorityModel extends Priority {
  const PriorityModel({
    required super.id,
    required super.category,
    required super.title,
    required super.description,
  });

  factory PriorityModel.fromJson(Map<String, dynamic> json) {
    return PriorityModel(
      id: json['id'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'description': description,
    };
  }
}