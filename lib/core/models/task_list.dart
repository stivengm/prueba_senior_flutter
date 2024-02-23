
class TaskListModel {
  String name;
  int value;


  TaskListModel({
    required this.name,
    required this.value
  });

}

List<TaskListModel> listState = [
  TaskListModel(
    name: 'Pendiente',
    value: 1
  ),
  TaskListModel(
    name: 'En proceso',
    value: 2
  ),
  TaskListModel(
    name: 'Completado',
    value: 3
  )
];