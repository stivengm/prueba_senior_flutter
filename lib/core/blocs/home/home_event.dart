part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HandleTask extends HomeEvent {
  final List<TaskModel> taskList;
  const HandleTask(this.taskList);
}

class AddTask extends HomeEvent {
  final List<TaskModel> taskList;
  const AddTask(this.taskList);
}

class CountRecords extends HomeEvent {
  final int countRecords;
  const CountRecords(this.countRecords);
}

class HandleStateTask extends HomeEvent {
  final StateGroup stateTask;
  final List<TaskModel> taskFilter;
  const HandleStateTask({required this.stateTask, required this.taskFilter});
}

class UpdateTaskById extends HomeEvent {
  final int idTaskUpdate;
  final int idTask;
  final List<TaskModel> taskFilter;
  final List<TaskModel>? taskList;
  const UpdateTaskById({required this.idTaskUpdate, required this.idTask, required this.taskFilter, this.taskList});
}

class HandleReload extends HomeEvent {
  final bool isReloadTaskInitial;
  const HandleReload(this.isReloadTaskInitial);
}