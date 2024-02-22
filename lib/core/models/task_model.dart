import 'dart:convert';

List<TaskModel> taskModelFromJson(String str) => List<TaskModel>.from(json.decode(str).map((x) => TaskModel.fromJson(x)));

String taskModelToJson(List<TaskModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskModel {
  int id;
  String nameWorker;
  String task;
  String dateFinish;
  String observations;
  int state;

  TaskModel({
    required this.id,
    required this.nameWorker,
    required this.task,
    required this.dateFinish,
    required this.observations,
    required this.state,
  });

  TaskModel copyWith({
    int? id,
    String? nameWorker,
    String? task,
    String? dateFinish,
    String? observations,
    int? state,
  }) => TaskModel(
    id: id ?? this.id,
    nameWorker: nameWorker ?? this.nameWorker,
    task: task ?? this.task,
    dateFinish: dateFinish ?? this.dateFinish,
    observations: observations ?? this.observations,
    state: state ?? this.state,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    nameWorker: json["nameWorker"],
    task: json["task"],
    dateFinish: json["dateFinish"],
    observations: json["observations"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameWorker": nameWorker,
    "task": task,
    "dateFinish": dateFinish,
    "observations": observations,
    "state": state,
  };
}
