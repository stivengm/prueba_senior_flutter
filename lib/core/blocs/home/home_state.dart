part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<TaskModel>? taskList;
  final int countRecords;
  final StateGroup stateTask;

  const HomeState({
    taskList,
    this.countRecords = 0,
    this.stateTask = StateGroup.statusPending
  }) : taskList = taskList ?? const [];

  HomeState copyWith({
    List<TaskModel>? taskList,
    int? countRecords,
    StateGroup? stateTask
  }) => HomeState(
    taskList: taskList ?? this.taskList,
    countRecords: countRecords ?? this.countRecords,
    stateTask: stateTask ?? this.stateTask
  );
  
  @override
  List<Object?> get props => [ taskList, countRecords, stateTask ];
}

final class HomeInitial extends HomeState {}
