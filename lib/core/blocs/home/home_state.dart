part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<TaskModel>? taskList;
  final List<TaskModel>? taskFilter;
  final bool isReloadTaskInitial;
  final int countRecords;
  final int idTaskUpdate;
  final int idTask;
  final StateGroup stateTask;

  const HomeState({
    taskList,
    taskFilter,
    this.isReloadTaskInitial = false,
    this.countRecords = 0,
    this.idTaskUpdate = 0,
    this.idTask = 0,
    this.stateTask = StateGroup.allStates
  }) : taskList = taskList ?? const [],
    taskFilter = taskFilter ?? const [];

  HomeState copyWith({
    List<TaskModel>? taskList,
    List<TaskModel>? taskFilter,
    bool? isReloadTaskInitial,
    int? countRecords,
    int? idTaskUpdate,
    int? idTask,
    StateGroup? stateTask
  }) => HomeState(
    taskList: taskList ?? this.taskList,
    countRecords: countRecords ?? this.countRecords,
    isReloadTaskInitial: isReloadTaskInitial ?? this.isReloadTaskInitial,
    idTaskUpdate: idTaskUpdate ?? this.idTaskUpdate,
    idTask: idTask ?? this.idTask,
    stateTask: stateTask ?? this.stateTask,
    taskFilter: taskFilter ?? this.taskFilter,
  );
  
  @override
  List<Object?> get props => [ taskList, taskFilter, countRecords, stateTask, idTaskUpdate, idTask, isReloadTaskInitial ];
}

final class HomeInitial extends HomeState {}
