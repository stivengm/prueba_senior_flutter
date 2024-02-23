import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/services.dart';
import 'package:prueba_senior_flutter_treebu/core/models/emun_task_state.dart';
import 'package:prueba_senior_flutter_treebu/core/models/task_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {

    on<HandleTask>((event, emit) {
      emit( state.copyWith( taskList: event.taskList ) );
    });

    on<CountRecords>((event, emit) {
      var counter = state.countRecords;
      counter++;
      emit( state.copyWith( countRecords: counter ) );
    });

    on<AddTask>((event, emit) {
      emit( state.copyWith( taskList: event.taskList ) );
    });

    on<UpdateTaskById>((event, emit) {
      List<TaskModel> listFiltered;
      listFiltered = state.taskList!.where((task) => task.id == event.idTask).toList();
      TaskModel updateTask = listFiltered[0];
      state.taskList!.remove(listFiltered[0]);
      updateTask.state = event.idTaskUpdate;
      listFiltered = state.taskList!;
      listFiltered.add(updateTask);
      emit( state.copyWith( idTaskUpdate: event.idTaskUpdate, taskFilter: listFiltered, taskList: listFiltered ) );
    });
    

    on<HandleStateTask>((event, emit) {
      List<TaskModel> listFiltered;
      if (event.stateTask == StateGroup.allStates) {
        listFiltered = state.taskList!;
      } else if (event.stateTask == StateGroup.statusPending) {
        listFiltered = state.taskList!.where((state) => state.state == 1).toList();
      } else if (event.stateTask == StateGroup.statusInProgress) {
        listFiltered = state.taskList!.where((state) => state.state == 2).toList();
      } else {
        listFiltered = state.taskList!.where((state) => state.state == 3).toList();
      }
      emit( state.copyWith( stateTask: event.stateTask, taskFilter: listFiltered ) );
    });

    readTaskJson();
  }

  Future<void> readTaskJson() async {
    final String response = await rootBundle.loadString('assets/task_list.json');
    final dataJson = jsonDecode(response);
    final List<TaskModel> taskModel = dataJson.map<TaskModel>((m) => TaskModel.fromJson(Map<String, dynamic>.from(m))).toList();

    add( HandleTask(taskModel) );
    add( HandleStateTask( stateTask: StateGroup.allStates, taskFilter: taskModel) );
  }

}
