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