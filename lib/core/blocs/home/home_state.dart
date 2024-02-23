part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<TaskModel>? taskList;
  final int countRecords;

  const HomeState({
    taskList,
    this.countRecords = 0
  }) : taskList = taskList ?? const [];

  HomeState copyWith({
    List<TaskModel>? taskList,
    int? countRecords
  }) => HomeState(
    taskList: taskList ?? this.taskList,
    countRecords: countRecords ?? this.countRecords
  );
  
  @override
  List<Object?> get props => [ taskList, countRecords ];
}

final class HomeInitial extends HomeState {}
