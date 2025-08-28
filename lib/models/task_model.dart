class TaskModel {
  String title;
  String description;
  String status;
  String createdBy;
  String? createdAt;

  TaskModel({
    required this.title,
    this.description = '',
    this.status = 'undone',
    required this.createdBy,
    this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json["title"],
        description: json["description"],
        status: json["status"],
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "status": status,
        "createdBy": createdBy,
        "createdAt": createdAt ?? DateTime.now(),
      };
}
