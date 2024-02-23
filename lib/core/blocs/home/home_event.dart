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
  const HandleStateTask(this.stateTask);
}