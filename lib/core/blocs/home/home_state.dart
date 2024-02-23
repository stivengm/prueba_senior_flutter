part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<TaskModel>? taskList;
  final List<TaskModel>? taskFilter;
  final int countRecords;
  final StateGroup stateTask;

  const HomeState({
    taskList,
    taskFilter,
    this.countRecords = 0,
    this.stateTask = StateGroup.allStates
  }) : taskList = taskList ?? const [],
    taskFilter = taskFilter ?? const [];

  HomeState copyWith({
    List<TaskModel>? taskList,
    List<TaskModel>? taskFilter,
    int? countRecords,
    StateGroup? stateTask
  }) => HomeState(
    taskList: taskList ?? this.taskList,
    countRecords: countRecords ?? this.countRecords,
    stateTask: stateTask ?? this.stateTask,
    taskFilter: taskFilter ?? this.taskFilter
  );
  
  @override
  List<Object?> get props => [ taskList, taskFilter, countRecords, stateTask ];
}

final class HomeInitial extends HomeState {}
