part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<TaskModel>? taskList;

  const HomeState({
    taskList
  }) : taskList = taskList ?? const [];

  HomeState copyWith({
    List<TaskModel>? taskList,
  }) => HomeState(
    taskList: taskList ?? this.taskList
  );
  
  @override
  List<Object?> get props => [ taskList ];
}

final class HomeInitial extends HomeState {}
