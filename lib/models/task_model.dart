import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final DateTime createdAt;
  final String createdBy;
  final String description;
  final String status;
  final String title;

  TaskModel({
    required this.createdAt,
    required this.createdBy,
    required this.description,
    required this.status,
    required this.title,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      createdAt: _parseTimestamp(json['createdAt']),
      createdBy: json['createdBy'],
      description: json['description'],
      status: json['status'],
      title: json['title'],
    );
  }

  static DateTime _parseTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    } else if (timestamp is String) {
      return DateTime.parse(timestamp);
    } else if (timestamp is DateTime) {
      return timestamp;
    } else {
      throw FormatException('Invalid timestamp format: $timestamp');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': Timestamp.fromDate(createdAt),
      'createdBy': createdBy,
      'description': description,
      'status': status,
      'title': title,
    };
  }
}
